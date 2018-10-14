//
// Created by Edward Hyde on 13/10/2018.
//

#include <iostream>
using namespace std;

extern "C" int add(int param1, int param2);
extern "C" double floatadd(double, double);
// pure assembly function
// args will be rdi, rsi
asm(
#ifdef __APPLE__
"_add:\n"
#endif
#if defined(__linux__) || defined(__unix__)
"add:\n"
#endif
"  lea (%rdi, %rsi), %rax\n"
"  movq %rax,%rdi\n"
"  ret\n"
);


// addsd: https://www.felixcloutier.com/x86/ADDSD.html
#ifdef __APPLE__
asm("_floatadd:\n"
#endif
#if defined(__linux__) || defined(__unix__)
asm("floatadd:\n"
#endif
    "    addsd %xmm1,%xmm0\n"
    "    ret\n");


// below inline asm functions
inline void inc(const int* dest) {
    __asm__ __volatile__ ("lock addl $1,(%0)"
    :
    : "r" (dest)
    : "cc",
      "memory");
}

inline void dec(const int* dest) {
    __asm__ __volatile__ ("lock subl $1,(%0)"
    :
    : "r" (dest)
    : "cc",
      "memory");
}

inline void add(int add_value, const int* dest) {
    __asm__ __volatile__ ("lock addl %0,(%2)"
    : "=r" (add_value)
    : "0"  (add_value),
      "r"  (dest)
    : "cc",
      "memory");
}

inline void cmpxchg (int exchange_value, volatile int* dest, int compare_value) {
    __asm__ __volatile__ ("lock cmpxchgl %1,(%3)"
    : "=a" (exchange_value)
    : "r" (exchange_value),
      "a" (compare_value),
      "r" (dest)
    : "cc", "memory");
}

int main() {
    int a = 5;

    //prints a = 5
    cout << "Initial a = " << a << endl;

    inc(&a);

    //prints a = 6
    cout << "After inc a = " << a << endl;

    dec(&a);

    //prints a = 5
    cout << "After dec a = " << a << endl << endl;

    int b = 10;

    //prints b = 10
    cout << "Initial b = " << b << endl;

    add(5, &b);

    //prints b = 15
    cout << "After add(5, &b) b = " << b << endl;

    cmpxchg(30, &b, 15);

    //prints 30
    cout << "After cmpxchg(30, &b, 15) b = " << b << endl << endl;

    //prints 13
    cout << "Direct call to asm from cpp add(6, 7): " << add(6, 7) << endl;

    double a1 = 1.5;
    double b2 = 1.2;
    double c3 = floatadd(a1,b2);
    printf("Adding two doubles a1 = 1.5 and b2 = 1.2 = %f\n",c3);

}