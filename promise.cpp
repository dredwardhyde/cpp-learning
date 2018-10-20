//
// Created by Edward Hyde on 20/10/2018.
//

#include <iostream>
#include <functional>
#include <thread>
#include <future>

void print_int (std::future<int>& fut) {
    std::cout << "Waiting for value..." << std::endl;
    int x = fut.get();
    std::cout << "Receiving in child thread: " << std::this_thread::get_id()  << " value: " << x  << std::endl;
}

/*
    Promise is a convenient way to transfer data between threads:

    Sending from main thread: 0x7fffa39a2380
    Waiting for value...
    Receiving in child thread: 0x70000c4db000 value: 10
 */
int main () {
    std::cout << "Sending from main thread: " << std::this_thread::get_id() << std::endl;
    std::promise<int> prom;
    std::future<int> fut = prom.get_future();
    std::thread th1 (print_int, std::ref(fut));
    std::this_thread::sleep_for(std::chrono::seconds(1));
    prom.set_value (10); //passing value to other thread
    th1.join();
    return 0;
}