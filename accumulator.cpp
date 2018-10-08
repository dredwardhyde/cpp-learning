//
// Created by Edward Hyde on 08/10/2018.
//
#include <functional>
#include <iostream>

using namespace std;

//using decay_t = typename decay<T>::type;

//If T is a function type, a function-to-pointer conversion is applied and the decay type is the same as: add_pointer<T>::type
//If T is an array type, an array-to-pointer conversion is applied and the decay type is the same as: add_pointer<remove_extent<remove_reference<T>::type>::type>::type
//Otherwise, a regular lvalue-to-rvalue conversion is applied and the decay type is the same as: remove_cv<remove_reference<T>::type>::type.

//typedef std::decay<int>::type A;           // int
//typedef std::decay<int&>::type B;          // int
//typedef std::decay<int&&>::type C;         // int
//typedef std::decay<const int&>::type D;    // int
//typedef std::decay<int[2]>::type E;        // int*
//typedef std::decay<int(int)>::type F;      // int(*)(int)

template<typename T>
struct recallable_impl {
    template<typename... Args>
    recallable_impl& operator()(Args&&... args) {
        f(std::forward<Args>(args)...);
        return *this;
    }
    template<typename F> recallable_impl(F&& f):f{std::forward<F>(f)} {}
private:
    T f;
};

template<typename T>
decltype(auto) recallable(T&& f) {
    return recallable_impl<std::decay_t<T>>(std::forward<T>(f));
}

int main()
{
    int a = 0;
    auto l1 = [&](int b) { a+=b; };
    recallable(l1)(1)(2)(3)(4)(5);
    std::cout << a << std::endl;
    return 0;
}

