#include <atomic>
#include <memory>
#include <chrono>
#include <iostream>
#include <thread>

template<typename T>
class queue
{
private:
    struct node;

    struct counted_node_ptr
    {
        int external_count;
        node* ptr;
    };

    struct node_counter
    {
        int internal_count:30;
        unsigned external_counters:2;
    };

    struct node
    {
        std::atomic<T*> data;
        std::atomic<node_counter> count;
        std::atomic<counted_node_ptr> next;

        node()
        {
            node_counter new_count;
            new_count.internal_count=0;
            new_count.external_counters=2;
            count.store(new_count);

            counted_node_ptr next_node={0};
            next.store(next_node);
        }

        void release_ref()
        {
            node_counter old_counter=
                    count.load(std::memory_order_relaxed);
            node_counter new_counter;
            do
            {
                new_counter=old_counter;
                --new_counter.internal_count;
            }
            while(!count.compare_exchange_strong(
                    old_counter,new_counter,
                    std::memory_order_acquire,std::memory_order_relaxed));

            if(!new_counter.internal_count &&
               !new_counter.external_counters)
            {
                delete this;
            }
        }

    };

    std::atomic<counted_node_ptr> head;
    std::atomic<counted_node_ptr> tail;

    static void increase_external_count(
            std::atomic<counted_node_ptr>& counter,
            counted_node_ptr& old_counter)
    {
        counted_node_ptr new_counter;

        do
        {
            new_counter=old_counter;
            ++new_counter.external_count;
        }
        while(!counter.compare_exchange_strong(
                old_counter,new_counter,
                std::memory_order_acquire,
                std::memory_order_relaxed));

        old_counter.external_count=new_counter.external_count;
    }

    void set_new_tail(counted_node_ptr &old_tail,
                      counted_node_ptr const &new_tail)
    {
        node* const current_tail_ptr=old_tail.ptr;
        while(!tail.compare_exchange_weak(old_tail,new_tail) &&
              old_tail.ptr==current_tail_ptr);
        if(old_tail.ptr==current_tail_ptr)
        {
            free_external_counter(old_tail);
        }
        else
        {
            current_tail_ptr->release_ref();
        }
    }

    static void free_external_counter(counted_node_ptr &old_node_ptr)
    {
        node* const ptr=old_node_ptr.ptr;
        int const count_increase=old_node_ptr.external_count-2;

        node_counter old_counter=
                ptr->count.load(std::memory_order_relaxed);
        node_counter new_counter;
        do
        {
            new_counter=old_counter;
            --new_counter.external_counters;
            new_counter.internal_count+=count_increase;
        }
        while(!ptr->count.compare_exchange_strong(
                old_counter,new_counter,
                std::memory_order_acquire,std::memory_order_relaxed));

        if(!new_counter.internal_count &&
           !new_counter.external_counters)
        {
            delete ptr;
        }
    }

public:
    queue()
    {
        counted_node_ptr new_node;
        new_node.external_count=1;
        new_node.ptr=new node;

        head.store(new_node);
        tail.store(new_node);
    }

    queue(const queue& other)=delete;
    queue& operator=(const queue& other)=delete;

    ~queue()
    {
        while(pop());
        delete head.load().ptr;
    }
    std::unique_ptr<T> pop()
    {
        counted_node_ptr old_head=head.load(std::memory_order_relaxed);
        for(;;)
        {
            increase_external_count(head,old_head);
            node* const ptr=old_head.ptr;
            if(ptr==tail.load().ptr)
            {
                return std::unique_ptr<T>();
            }
            counted_node_ptr next=ptr->next.load();
            if(head.compare_exchange_strong(old_head,next))
            {
                T* const res=ptr->data.exchange(NULL);
                free_external_counter(old_head);
                return std::unique_ptr<T>(res);
            }
            ptr->release_ref();
        }
    }

    void push(T new_value)
    {
        std::unique_ptr<T> new_data(new T(new_value));
        counted_node_ptr new_next;
        new_next.ptr=new node;
        new_next.external_count=1;
        counted_node_ptr old_tail=tail.load();

        for(;;)
        {
            increase_external_count(tail,old_tail);

            T* old_data=NULL;
            if(old_tail.ptr->data.compare_exchange_strong(
                    old_data,new_data.get()))
            {
                counted_node_ptr old_next={0};
                if(!old_tail.ptr->next.compare_exchange_strong(
                        old_next,new_next))
                {
                    delete new_next.ptr;
                    new_next=old_next;
                }
                set_new_tail(old_tail, new_next);
                new_data.release();
                break;
            }
            else
            {
                counted_node_ptr old_next={0};
                if(old_tail.ptr->next.compare_exchange_strong(
                        old_next,new_next))
                {
                    old_next=new_next;
                    new_next.ptr=new node;
                }
                set_new_tail(old_tail, old_next);
            }
        }
    }
};

void producer(queue<int>* stack){
    for(int i = 0; i < 1000;i++){
        stack->push(i);
    }
}

void consumer(queue<int>* stack){
    while(std::unique_ptr<int> res = stack->pop()){
        std::cout << res << std:: endl;
    }
}

int main(){
    auto* stack = new queue<int>();
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
//    std::thread d(consumer, std::ref(stack));
//    std::thread f(consumer, std::ref(stack));
    c.join();
//    d.join();
//    f.join();
    done = std::chrono::high_resolution_clock::now();
    resultTime = std::chrono::duration_cast<std::chrono::nanoseconds>(done - start).count();
    std::cout << "Popping: " << resultTime << std::endl;
    delete stack;
}
