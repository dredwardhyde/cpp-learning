//
// Created by Edward Hyde on 08/10/2018.
//
#include <functional>
#include <iostream>
using namespace std;
//container for a function/lambda
//T - type of function, std::function for example
template<typename T>
struct recallable {
    //template with template parameter pack
    template<typename... Args>
    //overloaded method receives arguments to original function
    recallable& operator()(Args&&... args) {
        //and invokes function with it
        f(std::forward<Args>(args)...);
        //then returns itself as a container for function
        return *this;
    }
    //constructor which receives function/lambda and captures it
    explicit recallable(const T& f) : f{f} {}
private:
    //reference to function
    const T& f;
};

//function receives lambda and returns recallable structure
template<typename T> recallable<T> r(const T& f) {return recallable<T>{f};}

int main()
{
    int a = 0;
    auto l1 = [&](int b) { a+=b; };
    r(l1)(1)(2)(3)(4)(5);
    std::cout << a << std::endl;
    return 0;
}

