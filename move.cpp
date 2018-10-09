//
// Created by Edward Hyde on 09/10/2018.
//

#include <utility>
#include <iostream>

template <typename T> void swapWithCopying(T& a, T& b)
{
    T tmp(a);   // now we have two copies of a
    std::cout << std::endl << "Now \"a\" is NOT empty: " << a << std::endl;
    a = b;      // now we have two copies of b
    std::cout << "Now \"b\" is NOT empty: " << b << std::endl;
    b = tmp;    // now we have two copies of tmp (aka a)
    std::cout << "Now \"tmp\" is NOT empty: " << tmp << std::endl << std::endl;
}

template <typename T> void swapWithoutCopying(T& a, T& b)
{
    // roughly equivalent to static_cast<T&&>(t);
    // as a cast, it does not do anything during runtime.
    // it is only relevant at compile time to tell the compiler
    // that you would like to continue considering the reference as an rvalue.

    // what it does not do:
    // - make a copy of the argument
    // - call the copy constructor
    // - change the argument object

    T tmp(std::move(a));
    std::cout << std::endl << "Now \"a\" is empty: " << a << std::endl;
    a = std::move(b);
    std::cout << "Now \"b\" is empty: " << b << std::endl;
    b = std::move(tmp);
    std::cout << "Now \"tmp\" is empty: " << tmp << std::endl << std::endl;
}

template <typename T> void swapWithCast(T& a, T& b)
{
    // now test with static_cast<T&&>(t); instead of std::move
    // same results as with std::move
    T tmp(static_cast<T&&>(a));
    std::cout << std::endl << "Now \"a\" is empty: " << a << std::endl;
    a = static_cast<T&&>(b);
    std::cout << "Now \"b\" is empty: " << b << std::endl;
    b = static_cast<T&&>(tmp);
    std::cout << "Now \"tmp\" is empty: " << tmp << std::endl << std::endl;
}

/*
    Before: a = lol b = kek

    Now "a" is NOT empty: lol
    Now "b" is NOT empty: kek
    Now "tmp" is NOT empty: lol

    After first swap: a = kek b = lol

    Now "a" is empty:
    Now "b" is empty:
    Now "tmp" is empty:

    After second swap: a = lol b = kek

    Now "a" is empty:
    Now "b" is empty:
    Now "tmp" is empty:

    After third swap: a = kek b = lol
 */
int main(){

    std::string a = "lol";
    std::string b = "kek";

    std::cout << "Before: a = " << a << " b = " << b << std::endl;
    swapWithCopying(a, b);
    std::cout << "After first swap: a = " << a << " b = " << b << std::endl;
    swapWithoutCopying(a, b);
    std::cout << "After second swap: a = " << a << " b = " << b << std::endl;
    swapWithCast(a, b);
    std::cout << "After third swap: a = " << a << " b = " << b << std::endl;

}



