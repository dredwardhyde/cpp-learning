//
// Created by Edward Hyde on 11/10/2018.
//

#include <thread>
#include <atomic>
#include <string>
#include <cassert>

std::atomic<std::string*> ptr;

int data;

void producer() {
    auto p   = new std::string("Hello");

    data = 42;

    ptr.store(p, std::memory_order_release);
}

void consumer() {
    std::string* p2;

    while (!(p2 = ptr.load(std::memory_order_acquire)));
    //while (!(p2 = ptr.load(std::memory_order_consume)));
    assert(*p2 == "Hello");
    assert(data == 42);  // must be 42
}

int main() {
    std::thread t1(producer);
    std::thread t2(consumer);
    t1.join();
    t2.join();
}