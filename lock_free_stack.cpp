//
// Created by Edward Hyde on 28/10/2018.
//

#include <atomic>
#include <memory>
#include <thread>
#include <iostream>

/*
 * Lock-free stack implementation for x86_64 because it allows atomic DWCAS:
 * https://www.felixcloutier.com/x86/CMPXCHG8B:CMPXCHG16B.html
 *
 * Converts to:
 * lock		cmpxchg16b	(%r14)
 */

template<typename T>
class lock_free_stack {
private:
    struct node;
    // sizeof(counted_node_ptr) == 16 bytes = 8 for ptr + 4 for external_count + 4 padding
    // head.is_lock_free() == 1
    // First, the external count is wrapped together with the node pointer in the counted_ node_ptr structure
    // On those platforms that support a double-word-compare-and-swap operation,
    // this structure will be small enough for std::atomic<counted_node_ptr> to be lock-free.
    struct counted_node_ptr {
        int external_count;
        node* ptr;
    };
    struct node {
        std::shared_ptr<T> data;
        // This can then be used for the next pointer in the node structure alongside the internal count
        std::atomic<int> internal_count;
        counted_node_ptr next;
        node(T const& data_): data(std::make_shared<T>(data_)), internal_count(0) {}
    };
    //Because counted_node_ptr is just a simple struct, you can use it with the std::atomic<> template for the head of the list
    std::atomic<counted_node_ptr> head;

    // This time, once you’ve loaded the value of head, you must first increase the count of external
    // references to the head node to indicate that you’re referencing it and to ensure that it’s safe to dereference it.
    // If you dereference the pointer before increasing the reference count, another thread could free the node before you access it,
    // thus leaving you with a dangling pointer. This is the primary reason for using the split reference count: by incrementing
    // the external reference count, you ensure that the pointer remains valid for the duration of your access.
    // The increment is done with a compare_exchange_strong() loop B that compares and sets the whole structure
    // to ensure that the pointer hasn’t been changed by another thread in the meantime.
    void increase_head_count(counted_node_ptr& old_counter) {
        counted_node_ptr new_counter;
        do {
            new_counter = old_counter;
            ++new_counter.external_count;
        } while(!head.compare_exchange_strong(
                old_counter,new_counter,
                std::memory_order_acquire,
                std::memory_order_relaxed));
        old_counter.external_count = new_counter.external_count;
    }
public:
    ~lock_free_stack() {
        std::cout << "destruction of stack" << std::endl;
        while(pop());
    }
    void push(T const& data) {
        // You construct a counted_node_ptr that refers to a freshly allocated node with
        // associated data and set the next value of the node to the current value of head.
        // The counts are set up so the internal_count is zero, and the external_count is one.
        // Because this is a new node, there’s currently only one external reference to the node (the head pointer itself).
        counted_node_ptr new_node;
        new_node.ptr = new node(data);
        new_node.external_count = 1;
        new_node.ptr->next = head.load(std::memory_order_relaxed);
        while(!head.compare_exchange_weak(
                new_node.ptr->next, new_node,
                std::memory_order_release,
                std::memory_order_relaxed));
    }
    std::shared_ptr<T> pop() {
        counted_node_ptr old_head = head.load(std::memory_order_relaxed);
        for(;;) {
            increase_head_count(old_head);
            // Once the count has been increased, you can safely dereference the ptr field of
            // the value loaded from head in order to access the pointed-to node
            node* const ptr = old_head.ptr;
            // If the pointer is a null pointer, you’re at the end of the list: no more entries.
            if(!ptr) {
                return std::shared_ptr<T>();
            }
            //If the pointer isn’t a null pointer, you can try to remove the node by a compare_exchange_strong() call on head and node next to head.
            if(head.compare_exchange_strong(old_head,ptr->next,std::memory_order_relaxed)) {
                // If the compare_exchange_strong() succeeds, you’ve taken ownership of the node and can swap out the data in preparation for returning it.
                // This ensures that the data isn’t kept alive just because other threads accessing the stack happen to still have pointers to its node.
                std::shared_ptr<T> res;
                res.swap(ptr->data);
                // If the reference count is now zero, the previous value (which is what fetch_add returns) was the negative of what you just added,
                // in which case you can delete the node. It’s important to note that the value you add is actually two less than the external count
                // You’ve removed the node from the list, so you drop one off the count for that,
                // and you’re no longer accessing the node from this thread, so you drop another off the count for that.

                // Previously you increased old_head.external_count by 1 so you have to add -1 to internal_count to decrease it by one
                // So if that's not the case and internal_count != -count_increase - there is another node that references it at this point
                int const count_increase = old_head.external_count - 2;
                // Then you can add the external count to the internal count on the node with an atomic fetch_add
                if(ptr->internal_count.fetch_add(count_increase,std::memory_order_release) == -count_increase) {
                    delete ptr;
                }
                // Whether or not you deleted the node, you’ve finished, so you can return the data
                return res;
            } else if(ptr->internal_count.fetch_add(-1,std::memory_order_relaxed) == 1) {
                // If the compare/exchange fails, another thread removed your node before you did,
                // or another thread added a new node to the stack. Either way, you need to start again
                // with the fresh value of head returned by the compare/exchange call. But first you must
                // decrease the reference count on the node you were trying to remove. This thread won’t access it anymore.
                // If you’re the last thread to hold a reference (because another thread removed it from the stack),
                // the internal reference count will be 1, so subtracting 1 will set the count to zero.
                // In this case, you can delete the node here before you loop.
                ptr->internal_count.load(std::memory_order_acquire);
                delete ptr;
            }
        }
    }
};

void producer(lock_free_stack<int>* stack){
    for(int i = 0; i < 1000;i++){
        stack->push(i);
    }
}

void consumer(lock_free_stack<int>* stack){
    while(std::shared_ptr<int> res = stack->pop()){

    }
}

// Pushing: 420863 ns
// Popping: 934424 ns
int main(){
    auto* stack = new lock_free_stack<int>();
    auto start = std::chrono::high_resolution_clock::now();
    std::thread a(producer, std::ref(stack));
    std::thread b(producer, std::ref(stack));
    std::thread e(producer, std::ref(stack));
    a.join();
    b.join();
    e.join();
    auto done = std::chrono::high_resolution_clock::now();
    long resultTime = std::chrono::duration_cast<std::chrono::nanoseconds>(done - start).count();
    std::cout << "Pushing: " << resultTime << std::endl;
    start = std::chrono::high_resolution_clock::now();
    std::thread c(consumer, std::ref(stack));
    std::thread d(consumer, std::ref(stack));
    std::thread f(consumer, std::ref(stack));
    c.join();
    d.join();
    f.join();
    done = std::chrono::high_resolution_clock::now();
    resultTime = std::chrono::duration_cast<std::chrono::nanoseconds>(done - start).count();
    std::cout << "Popping: " << resultTime << std::endl;
    delete stack;
}