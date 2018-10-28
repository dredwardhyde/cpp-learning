//
// Created by Edward Hyde on 25/10/2018.
//

#include <thread>
#include <iostream>
#include "threadsafe_queue_tuned.h"

threadsafe_queue_tuned<std::string> data_queue;

int DATA_CHUNKS = 100;
int volatile PREPARED = 0;

void data_preparation_thread(){
    while(PREPARED <= DATA_CHUNKS){
        std::this_thread::sleep_for(std::chrono::seconds(1));
        data_queue.push(std::to_string(PREPARED));
        PREPARED++;
    }
}

void data_processing_thread(){
    while(true){
        std::cout << "Waiting: " << std::this_thread::get_id() << std::endl << std::flush;
        std::shared_ptr<std::string> data = data_queue.wait_and_pop();
        std::cout << "Data: " << *data << " Thread: " << std::this_thread::get_id() << std::endl << std::flush;
        if(PREPARED == DATA_CHUNKS) break;
    }
}

int main(){
    std::thread t1(data_preparation_thread);
    std::thread t2(data_processing_thread);
    std::thread t3(data_processing_thread);
    t1.join();
    t2.join();
    t3.join();
}