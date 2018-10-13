//
// Created by Edward Hyde on 13/10/2018.
//

#include <stdio.h>
#include <stdint.h>
#include <iostream>
#include <sys/types.h>
#include <sys/sysctl.h>

using namespace std;

void print_cpu_info() {

    uint64_t freq = 0;
    size_t size = sizeof(freq);

    sysctlbyname("hw.cpufrequency", &freq, &size, nullptr, 0);
    cout << freq << endl;

    char buf[100];
    size_t buflen = 100;
    sysctlbyname("machdep.cpu.brand_string", &buf, &buflen, nullptr, 0);
    cout << buf << endl;

    char buf2[1000];
    size_t buflen2 = 1000;
    sysctlbyname("machdep.cpu.features", &buf2, &buflen2, nullptr, 0);
    cout << buf2 << endl;

    char buf3[100];
    size_t buflen3 = 100;
    sysctlbyname("machdep.cpu.core_count", &buf3, &buflen3, nullptr, 0);
    cout << buf3 << endl;

    char buf4[100];
    size_t buflen4 = 100;
    sysctlbyname("machdep.cpu.thread_count", &buf4, &buflen4, nullptr, 0);
    cout << buf4 << endl;
}

int main(){
    print_cpu_info();
}

