//
// Created by Edward Hyde on 15/10/2018.
//

#include <csetjmp>
#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <random>

#define TOO_DEEP_RECURSION 1
jmp_buf env;

void recursive100(int level) {
    if (level == 100) {
        std::cout << "Inside recursive call" << std::endl;
        longjmp(env, TOO_DEEP_RECURSION);
    }
    recursive100(level + 1);
}

int main() {
    int val;
    std::random_device rd;
    std::mt19937 mt(rd());
    std::uniform_real_distribution<double> dist(1.0, 10.0);
    //Init with truly random number
    double rand = dist(mt);
    std::cout << "Before error: " << rand << std::endl;
    //Point of frame restoring, execution of main() continues from here
    val = setjmp(env);
    //Initially val == 0 and we make recursive100 call
    if(val) {
        //recursive100 restore int main() frame with original rand value, but val now equal 1
        //because we returned it from recursive100
        std::cout << "After error: " << rand << std::endl;
        fprintf(stderr,"Exception with code %d",val);
        return val;
    }
    recursive100(1);
    return 0;
}

