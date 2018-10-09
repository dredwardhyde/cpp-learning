//
// Created by Edward Hyde on 09/10/2018.
//

#include <utility>
#include <iostream>

//receives only lvalue
void overloaded (const int& x) {std::cout << " overloaded (const int& x) [lvalue] " << x;}

//passes rvalue "0" as lvalue, lvalue "int a = 5" just as it is
template <class T> void fn (T&& x) {
    overloaded (std::forward<T>(x));
}

//prints
//calling fn with lvalue like "int a = 5" :  overloaded (const int& x) [lvalue] 5
//calling fn with rvalue like 0 :  overloaded (const int& x) [lvalue] 0
int main () {
    //allocated variable - lvalue
    int a = 5;

    std::cout << "calling fn with lvalue like \"int a = 5\" : ";
    fn (a);
    std::cout << '\n';

    std::cout << "calling fn with rvalue like 0 : ";
    //0 - unallocated number - rvalue
    fn (0);
    std::cout << '\n';

    return 0;
}