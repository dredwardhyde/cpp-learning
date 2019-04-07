//
// Created by Edward Hyde on 29/10/2018.
//

#include <iostream>
#include <utility>
#include <atomic>

//Test for 16-byte atomic
struct A { long a; long b; };
struct B { int x, y; };
int main() {
    std::cout << std::boolalpha
              << "std::atomic<A> is lock free? "
              #ifndef __USE_GNU
              << std::atomic<A>{}.is_lock_free() << '\n'
              #endif
              << "std::atomic<B> is lock free? "
              << std::atomic<B>{}.is_lock_free() << '\n';
}