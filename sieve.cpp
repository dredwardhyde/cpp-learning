//
// Created by Edward Hyde on 09/10/2018.
//

#include <cstring>
#include <iostream>

//  1.  Create a list of consecutive integers from 2 to n: (2, 3, 4, …, n).
//  2.  Initially, let p equal 2, the first prime number.
//  3.  Starting from p, count up in increments of p and mark each of these numbers
//      greater than p itself in the list. These numbers will be 2p, 3p, 4p, etc.;
//      note that some of them may have already been marked.
//  4.  Find the first number greater than p in the list that is not marked.
//      If there was no such number, stop. Otherwise, let p now equal this number
//      (which is the next prime), and repeat from step 3.

void sieve(int n)
{
    bool prime[n+1];
    memset(prime, true, sizeof(prime));

    //repeat until p <= sqrt(n)
    for (int p = 2; p * p <= n; p++) {
        //if number is not changed, then is it prime
        if (prime[p]) {
            //mark all numbers 2p,3p... <= n as not prime
            for (int i = p * 2; i <= n; i += p)
                prime[i] = false;
        }
    }

    for (int p = 2; p <= n; p++)
        if (prime[p])
            std::cout << p << " ";
}

int main()
{
    int n = 30;
    std::cout << "Primes <= " << n << std::endl;
    sieve(n);
    return 0;
}