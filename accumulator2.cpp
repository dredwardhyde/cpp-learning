//
// Created by Edward Hyde on 09/10/2018.
//

#include <functional>
#include <iostream>

int main()
{
    int a = 5;
    auto lambda = [&](int b) {
        auto impl = [&](int b){std::cout << (a + b) << std::endl;};
        impl(b);
        return impl;
    };
    lambda(1)(2);
    return 0;
}