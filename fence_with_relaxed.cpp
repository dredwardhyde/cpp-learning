//
// Created by Edward Hyde on 23/10/2018.
//

#include <atomic>
#include <thread>
#include <assert.h>

//all those could be nonatomic variables
std::atomic<bool> x,y;
std::atomic<int> z;
void write_x_then_y() {
    x.store(true,std::memory_order_relaxed);
    std::atomic_thread_fence(std::memory_order_release); //must be between two stores
    y.store(true,std::memory_order_relaxed);
}

void read_y_then_x() {
    while(!y.load(std::memory_order_relaxed));
    std::atomic_thread_fence(std::memory_order_acquire); //must be between two loads
    if(x.load(std::memory_order_relaxed))
        ++z;
}
/*
 * In this case, the release fence has the same effect as if the store to y
 * was tagged with memory_order_release rather than memory_order_relaxed.
 * Likewise, the acquire fence makes it as if the load from y was tagged with memory_order_ acquire.
 */
int main() {
    x=false;
    y=false;
    z=0;
    std::thread a(write_x_then_y);
    std::thread b(read_y_then_x);
    a.join();
    b.join();
    //never fires
    assert(z.load()!=0);
}