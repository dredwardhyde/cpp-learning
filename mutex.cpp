//
// Created by Edward Hyde on 15/10/2018.
//

#include <iostream>
#include <chrono>
#include <thread>
#include <mutex>

int shared = 0;
std::mutex mutexManual;
std::mutex mutexAuto;

void incrementManualLock(int id) {
    for (int i = 0; i < 3; ++i) {
        mutexManual.lock();
        ++shared;
        std::cout << id << " => " << shared << " thread: " << std::this_thread::get_id() << '\n';
        mutexManual.unlock();
        std::this_thread::sleep_for(std::chrono::seconds(1));
    }
}

void incrementAuto(int id) {
    for (int i = 0; i < 3; ++i) {
        std::this_thread::sleep_for(std::chrono::seconds(1));
        std::lock_guard<std::mutex> lock(mutexAuto);
        ++shared;
        std::cout << id << " => " << shared << " thread: " << std::this_thread::get_id() << '\n';
    }
}

/*
    0 => 1 thread: 140642051688192
    1 => 2 thread: 140642043234048
    0 => 3 thread: 140642051688192
    1 => 4 thread: 140642043234048
    1 => 5 thread: 140642043234048
    0 => 6 thread: 140642051688192

    4 => 7 thread: 140642051688192
    3 => 8 thread: 140642043234048
    4 => 9 thread: 140642051688192
    3 => 10 thread: 140642043234048
    3 => 11 thread: 140642043234048
    4 => 12 thread: 140642051688192
 */
int main() {
    std::thread t1(incrementManualLock, 0);
    std::thread t2(incrementManualLock, 1);
    t1.join();
    t2.join();

    std::this_thread::sleep_for(std::chrono::seconds(5));
    std::cout << std::endl;

    std::thread t3(incrementAuto, 3);
    std::thread t4(incrementAuto, 4);
    t3.join();
    t4.join();
}

