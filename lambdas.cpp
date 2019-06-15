//
// Created by Edward Hyde on 2019-06-14.
//

#include <iostream>
#include <algorithm>
#include <vector>


// https://www.bfilipek.com/2019/02/lambdas-story-part1.html?m=1
// https://www.bfilipek.com/2019/03/lambdas-story-part2.html

int global = 10;

int main() {

    static int static_int = 10;

    // lambda alternative
    struct {
        void operator()(int x) const {
            std::cout << x << '\n';
        }
    } someInstance;

    std::vector<int> v;
    v.push_back(1);
    v.push_back(2);
    std::for_each(v.begin(), v.end(), someInstance);
    std::for_each(v.begin(), v.end(), [] (int x) { std::cout << x << '\n';}
    );

    {
        int x = 1, y = 1;
        std::cout << x << " " << y << std::endl; // 1 1
        auto foo = [&x, &y]() { ++x; ++y; };
        foo();
        std::cout << x << " " << y << std::endl; // 2 2
    }

    {
        int x = 1, y = 1;
        std::cout << x << " " << y << std::endl; // 1 1
        auto foo = [x, y]() mutable { ++x; ++y; };
        foo();
        std::cout << x << " " << y << std::endl; // 1 1
    }

    {
        std::cout << global << std::endl; // 10
        auto foo = [=] () mutable { ++global; }; // captured by reference
        foo();
        std::cout << global << std::endl; // 11
        [] { ++global; } (); // captured by reference
        std::cout << global << std::endl; // 12
        // error: 'global' cannot be captured because it does not have automatic storage duration
        // [global] { ++global; } ();
    }

    {
        std::cout << static_int << std::endl; // 10
        auto foo = [=] () mutable { ++static_int; }; // captured by reference
        foo();
        std::cout << static_int << std::endl; // 11
        [] { ++static_int; } (); // captured by reference
        std::cout << static_int << std::endl; // 12
        // error: 'static_int' cannot be captured because it does not have automatic storage duration
        // [static_int] { ++static_int; } ();
    }
}