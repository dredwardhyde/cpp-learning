//
// Created by Edward Hyde on 2019-10-01.
//

#include <iostream>
#include <xmmintrin.h>
#include <immintrin.h>
#include <iomanip>

double mul_add(double a, double b, double c) {
    double g = a * b;
    double m = g + c;
    return m;
}

double fma(double a, double b, double c){
    double r;
    __m128d xx, yy, zz;
    xx = _mm_set_sd(a);
    yy = _mm_set_sd(b);
    zz = _mm_set_sd(c);
    r = _mm_cvtsd_f64(_mm_fmadd_pd(xx,yy,zz));
    return r;
}
int main() {
    double a = 3.141592653589790001;
    double b = 3.141592653589790001;
    double c = 3.141592653589790001;
    std::cout << std::setprecision (17) << mul_add(a, b, c) << std::endl;
    std::cout << std::setprecision (17) << fma(a, b, c) << std::endl;
}