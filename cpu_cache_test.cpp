//
// Created by Edward Hyde on 01/05/2019.
//

#include <cstdio>

char a[78];

unsigned long long gettsc() {
    unsigned long long t;
    asm volatile(
    "mfence\n\t"
    "rdtsc\n\t"
    "shl $32,%%rdx\n\t"
    "or %%rdx,%%rax\n\t":"=a"(t)::"rdx");
    return t;
}

int main() {
    unsigned long long t0, t1;
    t0 = gettsc();
    t1 = gettsc();
    a[50] = 'c';
    char b;
    char x[2];
    for (int j = 0; j < 2; j++) {
        t0 = gettsc();
        b = a[50];
        t0 = gettsc() - t0;
        x[0] = b;
        asm volatile("mfence\n\t"
                     "clflush (%0)\n\t"
        ::
        "r"(&a[50]));
        t1 = gettsc();
        b = a[50];
        t1 = gettsc() - t1;
        x[1] = b;
    }
    printf("%c\n", x[0]);
    printf("%c\n", x[1]);
    printf("%lld\n", t0);
    printf("%lld\n", t1);
}
