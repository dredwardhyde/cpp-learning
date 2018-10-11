//
// Created by Edward Hyde on 11/10/2018.
//

#include <thread>
#include <iostream>
#include <string>
#include <cassert>

std::string* volatile ptr2;
int data;

/*
 *  In this example it is safe to write and read data in different threads on x86_64 systems
 */
void producer() {
    ptr2  = new std::string("Hello");
    //prevents reordering of storing variables to memory
    //see memory_order_intel_barrier.png
    //affects only order of generated assembly instructions, not asm code itself
    __asm__ __volatile__("":::"memory");
    data = 42;
}

void consumer() {
    //infinitely waits here with gcc options set(CMAKE_CXX_FLAGS "-O3 -Wall -Wextra")
    //if ptr2 not volatile because gcc optimizes it to while(true)
    //see memory_order_intel_volatile.png
    while (!(ptr2));
    assert(*ptr2 == "Hello");
    assert(data == 42); //must be 42 here
    std::cout << "Success" << std::endl;
}
//run g++ -S -O3 -Wall -Wextra  memory_order_intel.cpp to generate assembly code
int main() {
    std::thread t1(producer);
    std::thread t2(consumer);
    t1.join();
    t2.join();
}