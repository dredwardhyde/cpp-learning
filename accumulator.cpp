//
// Created by Edward Hyde on 08/10/2018.
//
#include <functional>
#include <iostream>

using namespace std;

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

