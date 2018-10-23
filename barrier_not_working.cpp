//
// Created by Edward Hyde on 23/10/2018.
//

#include <atomic>
#include <thread>
#include <assert.h>
std::atomic<bool> x,y;
std::atomic<int> z;

void write_x() {
    x.store(true,std::memory_order_release);
    //y.store(true,std::memory_order_release); --- In order to see the benefit of acquire-release ordering,
    //                                             you need to consider two stores from the same thread
}
void write_y() {
    y.store(true,std::memory_order_release);
}

void read_x_then_y() {
    while(!x.load(std::memory_order_acquire));
    if(y.load(std::memory_order_acquire))
        ++z;
}

void read_y_then_x() {
    while(!y.load(std::memory_order_acquire));
    if(x.load(std::memory_order_acquire))
        ++z;
}

/*
 * In this case the assert can fire (just like in the relaxed-ordering case),
 * because it’s possible for both the load of x and the load of y to read false. x and y are written
 * by different threads, so the ordering from the release to the acquire in each case has no effect
 * on the operations in the other threads.
 */
int main() {
    x=false;
    y=false;
    z=0;
    std::thread a(write_x);
    std::thread b(write_y);
    std::thread c(read_x_then_y);
    std::thread d(read_y_then_x);
    a.join();
    b.join();
    c.join();
    d.join();
    assert(z.load()!=0);
}