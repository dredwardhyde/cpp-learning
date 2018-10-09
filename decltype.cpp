//
// Created by Edward Hyde on 09/10/2018.
//

#include <iostream>
#include <string>
#include <sstream>

//to be able to add string with something
template <typename T>
std::string operator+(const std::string& Lhs, T Rhs)
{
    std::ostringstream Stream(Lhs, std::ios_base::out | std::ios_base::ate);
    Stream << Rhs;
    return Stream.str();
}

template <typename T, typename U>
auto Mix(T Lhs, U Rhs) -> decltype(Lhs + Rhs)
{
    return Lhs + Rhs;
}

int main()
{
    std::string str("20");

    //prints something like 2012 and the type is NSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE
    std::cout << Mix(str, 12) << " and the type is " << typeid(decltype(Mix(str, 12))).name() << std::endl;

    //prints something like 2015 and the type is NSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE
    std::cout << Mix(str, 15l) << " and the type is " << typeid(decltype(Mix(str, 3.1415))).name() << std::endl;

    //prints something like 203.1415 and the type is NSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE
    std::cout << Mix(str, 3.1415) << " and the type is " << typeid(decltype(Mix(str, 3.1415))).name() << std::endl;

    return 0;
}