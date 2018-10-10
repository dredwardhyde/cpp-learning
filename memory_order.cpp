//
// Created by Edward Hyde on 10/10/2018.
//

#include <thread>
#include <atomic>
#include <string>
#include <cassert>

std::atomic<std::string*> ptr;
std::atomic<std::string*> ptr2;

int data;

// Best explanation of memory order types:
// https://preshing.com/20140709/the-purpose-of-memory_order_consume-in-cpp11/
void producer() {
    auto p   = new std::string("Hello");
    auto p2  = new std::string("Hello");

    data = 42;

    ptr2.store(p2, std::memory_order_release);
    ptr.store(p, std::memory_order_release);
}

void consumer() {
    std::string* p2;
    std::string* p3;

    /*
     * A load operation with this memory order performs a consume operation on the
     * affected memory location: no reads or writes in the current thread
     *
     * DEPENDENT ON THE VALUE CURRENTLY LOADED
     *
     * can be reordered before this load. Writes to data-dependent variables in other
     * threads that release the same atomic variable are visible in the current thread.
     * On most platforms this affects compiler optimizations only (see Release-Consume ordering below)
     */
    while (!(p3 = ptr2.load(std::memory_order_consume)));

    assert(*p3 == "Hello");
    assert(data == 42); // may or may not be 42: data does not carry dependency from ptr2 (42 on Intel x86)
    /*
     * A load operation with this memory order performs the acquire operation on the
     * affected memory location: NO READS OR WRITES IN THE CURRENT THREAD can be
     * reordered before this load. ALL WRITES in other threads that release the same
     * atomic variable are visible in the current thread.
     */
    while (!(p2 = ptr.load(std::memory_order_acquire)));

    assert(*p2 == "Hello");
    assert(data == 42);  // must be 42
}

int main() {
    std::thread t1(producer);
    std::thread t2(consumer);
    t1.join();
    t2.join();
}