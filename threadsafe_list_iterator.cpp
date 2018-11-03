//
// Created by Edward Hyde on 03/11/2018.
//

#include <memory>
#include <mutex>

/*
 * The basic idea with fine-grained locking for a linked list is to have one mutex per node.
 * The benefit here is that operations on separate parts of the list are truly concurrent:
 * each operation holds only the locks on the nodes it’s actually interested in
 * and unlocks each node as it moves on to the next.
 *
 * All deadlocks are impossible because for_each, find_first_if and remove_if
 * locks nodes in the same order - from head to tail
 */
template<typename T>
class threadsafe_list {
    struct node {
        // Individual lock per node
        std::mutex m;
        std::shared_ptr<T> data;
        std::unique_ptr<node> next;
        node(): next() {}
        node(T const& value): data(std::make_shared<T>(value)) {}
    };

    // A default-constructed node is used for the head of the list, which starts with a NULL next pointer
    // It is always here and could not be removed or replaced
    node head;

public:
    threadsafe_list() {}
    ~threadsafe_list() {
        // Remove all nodes
        remove_if([](node const&){return true;});
    }
    threadsafe_list(threadsafe_list const& other)=delete;
    threadsafe_list& operator=(threadsafe_list const& other)=delete;

    // Push is simple - we only need one lock - to current head
    void push_front(T const& value){
        // Create new node with given value - expensive allocation occurs outside of any locks
        std::unique_ptr<node> new_node(new node(value));
        // Obtain a lock on head
        std::lock_guard<std::mutex> lk(head.m);
        // Current head->next become new_node->next
        new_node->next=std::move(head.next);
        // New head->next become new_node
        // So we basically insert new_node between head and old head->next
        head.next=std::move(new_node);
    }

    // In fine grained structures you have to provide custom for_each to ensure that no deadlock could occur during traversal
    // and user-supplied code can't change inner structure of the list
    // In for_each you need to be sure about two things:
    // - current could not be changed during current->next
    // - next could not be changed during user-defined function invocation
    template<typename Function>
    void for_each(Function f){
        node* current=&head;
        // Start from head, lock it and move forward
        std::unique_lock<std::mutex> lk(head.m);
        // Get next node
        while(node* const next=current->next.get()){
            // Lock it to get next->data
            std::unique_lock<std::mutex> next_lk(next->m);
            // We don't need previous node, so unlock it
            lk.unlock();
            // Call user-provided function
            f(*next->data);
            // Move forward - next become current
            current=next;
            // next_lk become lk
            lk=std::move(next_lk);
        }
    }

    // Just the same as for_each except small part in the middle
    template<typename Predicate>
    std::shared_ptr<T> find_first_if(Predicate p){
        node* current=&head;
        std::unique_lock<std::mutex> lk(head.m);
        while(node* const next=current->next.get()){
            std::unique_lock<std::mutex> next_lk(next->m);
            lk.unlock();

            // End traversal if predicate returns true
            // next_lk unlocks automatically at the end of current scope
            if(p(*next->data)){
                return next->data;
            }

            current=next;
            lk=std::move(next_lk);
        }

        // Nothing was found - return null
        return std::shared_ptr<T>();
    }

    template<typename Predicate>
    void remove_if(Predicate p){
        // Just as usual - start with current node (head at first)
        node* current=&head;
        // Lock it
        std::unique_lock<std::mutex> lk(head.m);
        // Move forward
        while(node* const next=current->next.get()){
            // Lock current->next
            std::unique_lock<std::mutex> next_lk(next->m);
            // If predicate returned true
            if(p(*next->data)){
                // Here BOTH locks lk and next_lk are LOCKED
                // Move node so it will be deleted at the end of scope
                std::unique_ptr<node> old_next=std::move(current->next);
                // Now current -> to_be_removed -> next_one
                // Changes to current -> next_one
                current->next=std::move(next->next);
                // So we need only to unlock mutex on deleted node
                // lk is the same - previous to next_one
                next_lk.unlock();
            }else{
                // If predicate returned false
                // Unlock current node
                lk.unlock();
                // Move one node forward
                current=next;
                lk=std::move(next_lk);
            }
        }
    }
};