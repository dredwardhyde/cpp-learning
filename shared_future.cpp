//
// Created by Edward Hyde on 20/10/2018.
//

#include <iostream>
#include <future>
#include <chrono>

/*
    Shared future is a convenient way to start some work at multiple threads at the same time

    Thread 1 received the signal 0.044314 ms after start
    Thread 2 received the signal 0.045051 ms after start
 */

int main() {
    //signal that both threads can proceed
    std::promise<void> ready_promise;
    std::shared_future<void> ready_future(ready_promise.get_future());

    //signal that threads started
    std::promise<void> t1_ready_promise, t2_ready_promise;

    //both thread started from main thread and ready to receive message
    std::chrono::time_point<std::chrono::high_resolution_clock> start;

    auto fun1 = [&, ready_future]() -> std::chrono::duration<double, std::milli> {
        t1_ready_promise.set_value(); //signals that thread started and ready
        ready_future.wait(); // waits for the signal from main()
        return std::chrono::high_resolution_clock::now() - start;
    };

    auto fun2 = [&, ready_future]() -> std::chrono::duration<double, std::milli> {
        t2_ready_promise.set_value(); //signals that thread started and ready
        ready_future.wait(); // waits for the signal from main()
        return std::chrono::high_resolution_clock::now() - start;
    };

    //launch two futures in two new threads
    auto result1 = std::async(std::launch::async, fun1);
    auto result2 = std::async(std::launch::async, fun2);

    // wait for the threads to become ready, only important to get start time
    t1_ready_promise.get_future().wait();
    t2_ready_promise.get_future().wait();

    // the threads are ready, start the clock
    start = std::chrono::high_resolution_clock::now();

    // signal the threads to go
    ready_promise.set_value();

    std::cout << "Thread 1 received the signal " << result1.get().count() << " ms after start\n"
              << "Thread 2 received the signal " << result2.get().count() << " ms after start\n";
}