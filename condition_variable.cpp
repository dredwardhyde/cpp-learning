//
// Created by Edward Hyde on 20/10/2018.
//

#include <mutex>
#include <queue>
#include <thread>
#include <iostream>

#if defined(__USE_GNU) || defined(__MINGW32__) || defined(__CYGWIN__)
    #include <condition_variable>
#endif
// Single producer & multiple consumers implementation in C++

std::mutex mut;
std::queue<std::string> data_queue;
std::condition_variable data_cond;

int DATA_CHUNKS = 100;
int volatile PREPARED = 0;

void data_preparation_thread(){
    while(PREPARED <= DATA_CHUNKS){
        std::this_thread::sleep_for(std::chrono::seconds(1));
        // lock mutex to add data to queue
        std::lock_guard<std::mutex> lk(mut);
        data_queue.push(std::to_string(PREPARED));
        // notify ONE thead which is waiting on this condition no wake and check it
        data_cond.notify_one();
        PREPARED++;
        // unlock mutex at the end of scope
    }
}

void data_processing_thread(){
    while(true){
        // lock for a moment
        std::unique_lock<std::mutex> lk(mut);
        std::cout << "Waiting: " << std::this_thread::get_id() << std::endl;
        // wait() automatically calls lk.unlock() , allowing other locked threads to continue
        //
        data_cond.wait(lk,[]{return !data_queue.empty();});
        // Once notified (explicitly, by some other thread),
        // the function unblocks and calls lck.lock(),
        // leaving lck in the same state as when the function was called.
        std::string data=data_queue.front();
        data_queue.pop();
        // unlock() lk and let producer to prepare more data
        lk.unlock();
        std::cout << data << " " << std::this_thread::get_id() << std::endl;
        if(PREPARED == DATA_CHUNKS) break;
    }
}

/*
    Waiting: 0x700007c8e000
    Waiting: 0x700007d11000
    0 0x700007c8e000
    Waiting: 0x700007c8e000
    1 0x700007d11000
    Waiting: 0x700007d11000
    2 0x700007c8e000
    Waiting: 0x700007c8e000
    3 0x700007d11000
    Waiting: 0x700007d11000
    4 0x700007c8e000
    Waiting: 0x700007c8e000
    5 0x700007d11000
    Waiting: 0x700007d11000
    6 0x700007c8e000
    Waiting: 0x700007c8e000
    7 0x700007d11000
 */
int main(){
    std::thread t1(data_preparation_thread);
    std::thread t2(data_processing_thread);
    std::thread t3(data_processing_thread);
    t1.join();
    t2.join();
    t3.join();
}