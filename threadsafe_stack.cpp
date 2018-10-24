//
// Created by Edward Hyde on 24/10/2018.
//

#include <exception>
#include <stack>
#include <mutex>
#include <thread>
#include <iostream>

struct empty_stack: std::exception {
    const char * what () const throw () {
        return "empty_stack";
    }
};

/*
 * Thread-safe stack
 *
 * The basic thread safety is provided by protecting each member function with a lock on the mutex, m.
 * This ensures that only one thread is actually accessing the data at any one time, so provided each member
 * function maintains the invariants, no thread can see a broken invariant.
 *
 * There’s a potential for a race condition between empty() and either of the pop() functions,
 * but because the code explicitly checks for the contained stack being empty while holding the lock in pop(),
 * this race condition isn’t problematic. By returning the popped data item directly as part of the call to pop(),
 * you avoid a potential race condition that would be present with separate top()
 * and pop() member functions such as those in std::stack<>.
 *
 * Because all the member functions use a std::lock_guard<> to protect the data,
 * it’s safe for any number of threads to call the stack member functions.
 *
 * Although it’s safe for multiple threads to call the member functions concurrently, because of the use of locks,
 * only one thread is ever actually doing any work in the stack data structure at a time.
 * This serialization of threads can potentially limit the performance of an application where there’s
 * significant contention on the stack: while a thread is waiting for the lock, it isn’t doing any useful work.
 * Also, the stack does not provide any means for waiting for an item to be added, so if a thread needs to wait,
 * it must periodically call empty() or just call pop() and catch the empty_stack exceptions.
 */
template <typename T>
class threadsafe_stack {
private:
    std::stack<T> data;
    mutable std::mutex m;
public:
    threadsafe_stack() = default;
    threadsafe_stack(const threadsafe_stack& other){
        std::lock_guard<std::mutex> lock(other.m);
        data = other.data;
    }

    threadsafe_stack&operator=(const threadsafe_stack&) = delete;

    void push(T new_value){
        std::lock_guard<std::mutex> lock(m);
        data.push(std::move(new_value));
    }

    std::shared_ptr<T> pop(){
        std::lock_guard<std::mutex> lock(m);
        if(data.empty()) throw  empty_stack();
        const std::shared_ptr<T> res(std::make_shared<T>(std::move(data.top())));
        data.pop();
        return res;
    }

    void pop(T& value){
        std::lock_guard<std::mutex> lock(m);
        if(data.empty()) throw empty_stack();
        value = std::move(data.top());
        data.pop();
    }

    bool empty() const {
        std::lock_guard<std::mutex> lock(m);
        return data.empty();
    }
};

void producer(threadsafe_stack<int>& stack){
    for(int i = 0; i < 20;i++){
        stack.push(i);
    }
}

void consumer(threadsafe_stack<int>& stack){
    while(!stack.empty()){
        std::cout << *stack.pop() << std::endl << std::flush;
    }
}

int main(){

    threadsafe_stack<int> stack;

    std::thread a(producer, std::ref(stack));
    std::thread b(producer, std::ref(stack));
    std::thread c(consumer, std::ref(stack));
    a.join();
    b.join();
    c.join();
}