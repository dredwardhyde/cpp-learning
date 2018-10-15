//
// Created by Edward Hyde on 15/10/2018.
//

#ifdef _USE_TSX

#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>

#define ARRAY_SIZE 2
#define NUM_THREADS 8
#define MAX_COUNT 1000000

struct tdata {
    int tid;
};

int counter[ARRAY_SIZE];

void *count(void *ptr) {
    long i, max = MAX_COUNT/NUM_THREADS;
    int tid = ((struct tdata *) ptr)->tid;
    __transaction_atomic {
            while (!counter[tid]);
            counter[(tid + 1) % NUM_THREADS] = 1;
    }
    return;
}

int main () {
    pthread_t threads[NUM_THREADS];
    int rc, i;
    struct tdata id[NUM_THREADS];
    for(i=0; i<NUM_THREADS; i++){
        id[i].tid = i;
        rc = pthread_create(&threads[i], NULL, count, (void *) &id[i]);
    }
    for(i=0; i<NUM_THREADS; i++){
        pthread_join(threads[i], NULL);
    }
    return 0;
}
#endif