//
// Created by Edward Hyde on 20/10/2018.
//

#include <iostream>
#include <future>
#include <chrono>

bool is_prime (int x) {
    for (int i=2; i<x; ++i) if (x%i==0) return false;
    return true;
}
/*
    Use std::async if you want some things done and don't really care when they're done,
    and std::packaged_task if you want to wrap up things in order to move them to other threads or call them later.

    checking with future, please wait...........
    444444443 is prime.
    checking with packaged_task, please wait..........
    444444443 is prime.
 */
int main () {
    //std::async with launch::async will try to run the task in a different thread
    std::future<bool> fut = std::async (std::launch::async, is_prime,444444443); //starts here automatically
    std::cout << "checking with future, please wait";
    std::chrono::milliseconds span (100);
    while (fut.wait_for(span)==std::future_status::timeout)
        std::cout << '.' << std::flush;
    bool x = fut.get();
    std::cout << "\n444444443 " << (x?"is":"is not") << " prime.\n";

    std::packaged_task<bool(int)> task(is_prime);
    auto f = task.get_future();
    std::cout << "checking with packaged_task, please wait";
    std::thread myThread(std::move(task),444444443); //we manually move task to another specific thread and start it
    while (f.wait_for(span)==std::future_status::timeout)
        std::cout << '.' << std::flush; //waiting just like with future
    bool x1 = f.get();
    std::cout << "\n444444443 " << (x1?"is":"is not") << " prime.\n";
    myThread.join();
    return 0;
}