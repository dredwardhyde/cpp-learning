//
// Created by Edward Hyde on 08/10/2018.
//
#include <functional>
#include <iostream>
using namespace std;
//container for a lambda
//T - type of target function, std::function<void(int)> in this example
template<typename T>
struct callable {
    //template with template parameter pack
    template<typename... Args>
    //overloaded method receives arguments to target function
    callable& operator()(Args&&... args) {
        //and invokes target function with them
        f(std::forward<Args>(args)...);
        //then returns itself as a container for target function
        return *this;
    }
    //constructor which receives function/lambda and captures it
    explicit callable(const T& f) : f{f} {}
private:
    //reference to function
    const T& f;
};

//function receives lambda and returns recallable structure
template<typename T> callable<T> r(const T& f) {return callable<T>{f};}

int main()
{
    int a = 0;
    std::function<void(int)> l1 = [&](int b) { a+=b; };
    r(l1)(1)(2)(3)(4)(5);
    std::cout << a << std::endl;
    return 0;
}

