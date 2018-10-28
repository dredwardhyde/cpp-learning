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
    struct counted_node_ptr {
        int external_count;
        node* ptr;
    };
    struct node {
        std::shared_ptr<T> data;
        std::atomic<int> internal_count;
        counted_node_ptr next;
        node(T const& data_): data(std::make_shared<T>(data_)), internal_count(0) {}
    };
    std::atomic<counted_node_ptr> head;
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
        std::cout << "Destruction" << std::endl; //I don't know why it is important, without this std::cout I've got EXC_BAD_ACCESS (code=2, address=0x1011d9000)
        while(pop());
    }
    void push(T const& data) {
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
            node* const ptr = old_head.ptr;
            if(!ptr) {
                return std::shared_ptr<T>();
            }
            if(head.compare_exchange_strong(old_head,ptr->next,std::memory_order_relaxed)) {
                std::shared_ptr<T> res;
                res.swap(ptr->data);
                int const count_increase = old_head.external_count-2;
                if(ptr->internal_count.fetch_add(count_increase,std::memory_order_release) ==- count_increase) {
                    delete ptr;
                }
                return res;
            } else if(ptr->internal_count.fetch_add(-1,std::memory_order_relaxed) == 1) {
                ptr->internal_count.load(std::memory_order_acquire);
                delete ptr;
            }
        }
    }
};

void producer(lock_free_stack<int>& stack){
    for(int i = 0; i < 20;i++){
        stack.push(i);
    }
}

void consumer(lock_free_stack<int>& stack){
    while(std::shared_ptr<int> res = stack.pop()){
        std::cout << *res << std::endl << std::flush;
    }
}

int main(){
    lock_free_stack<int> stack;
    std::thread a(producer, std::ref(stack));
    std::thread b(producer, std::ref(stack));
    a.join();
    b.join();
    std::thread c(consumer, std::ref(stack));
    std::thread d(consumer, std::ref(stack));
    c.join();
    d.join();
}