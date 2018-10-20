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
    checking, please wait..........
    444444443 is prime.
 */
int main () {
    std::future<bool> fut = std::async (is_prime,444444443);
    std::cout << "checking, please wait";
    std::chrono::milliseconds span (100);
    while (fut.wait_for(span)==std::future_status::timeout)
        std::cout << '.' << std::flush;
    bool x = fut.get();
    std::cout << "\n444444443 " << (x?"is":"is not") << " prime.\n";
    return 0;
}