//
// Created by Edward Hyde on 19/10/2018.
//

#include <emmintrin.h>
#include <immintrin.h>
#include <thread>
#include <iostream>

using namespace std;

#define n_threads 2
#define OPSIZE 1000000000
typedef struct Account{
    long balance;
    long number;
} account_t;

typedef struct Bank{
    account_t* accounts;
    long size;
} bank_t;

bool done = 0;
long *tx, *_abort, *capacity, *debug, *failed, *conflict, *zero;

// global scope
volatile int Touch;

void* f1(bank_t* bank, int id){
    for(int i=0; i<OPSIZE; i++){
        int src = rand()%bank->size;
        int dst = rand()%bank->size;
        while(src == dst){
            dst = rand()%bank->size;
        }
        //Touch = bank->accounts[src].balance + bank->accounts[dst].balance;
        // Note, this will touch the location (and load the page table) for for current src and dst
        // PREFETCH will not necessarily fetch the data should the page(s) not be mapped by the TLB
        while(true){
            unsigned in_progress = _xtest ();
            if(in_progress != 0) continue;
            unsigned stat =  _xbegin();
            if(stat == _XBEGIN_STARTED){
                bank->accounts[src].balance++;
                bank->accounts[dst].balance--;
                _xend();
                tx[id]++;
                break;
            }else{
                _abort[id]++;

                if (stat == 0){
                    zero[id]++;
                    // ?? interrupt may have unmapped page holding [src] and/or [dst]
                    Touch = bank->accounts[src].balance + bank->accounts[dst].balance;
                    continue;
                }
                if (stat & _XABORT_CONFLICT){
                    conflict[id]++;
                }
                if (stat & _XABORT_CAPACITY){
                    capacity[id]++;
                }
                if (stat & _XABORT_DEBUG){
                    debug[id]++;
                }
                if ((stat & _XABORT_RETRY) == 0){
                    failed[id]++;
                    break;
                }
                if (stat & _XABORT_NESTED){
                    printf("[ PANIC ] _XABORT_NESTED\n");
                    exit(-1);
                }
                if (stat & _XABORT_EXPLICIT){
                    printf("[ panic ] _XBEGIN_EXPLICIT\n");
                    exit(-1);
                }
            }
        }
    }
    return NULL;
}
void* f2(){
    printf("_heartbeat function\n");
    long last_txs=0, last_aborts=0, last_capacities=0, last_debugs=0, last_faileds=0, last_conflicts=0, last_zeros = 0;
    long txs=0, aborts=0, capacities=0, debugs=0, faileds=0, conflicts=0, zeros = 0;
    while(1){
        last_txs = txs;
        last_aborts = aborts;
        last_capacities = capacities;
        last_debugs = debugs;
        last_conflicts = conflicts;
        last_faileds = faileds;
        last_zeros = zeros;

        txs=aborts=capacities=debugs=faileds=conflicts=zeros = 0;
        for(int i=0; i<n_threads; i++){
            txs += tx[i];
            aborts += _abort[i];
            faileds += failed[i];
            capacities += capacity[i];
            debugs += debug[i];
            conflicts += conflict[i];
            zeros += zero[i];
        }

        printf("txs\t%ld\taborts\t\t%ld\tfaileds\t%ld\tcapacities\t%ld\tdebugs\t%ld\tconflit\t%ld\tzero\t%ld\n",
               txs - last_txs, aborts - last_aborts , faileds - last_faileds,
               capacities- last_capacities, debugs - last_debugs, conflicts - last_conflicts,
               zeros- last_zeros);

        std::this_thread::sleep_for(1s);
    }
}

/*  macOS 10.13.6 (17G65) MacBook Pro 2017 Intel(R) Core(TM) i7-7820HQ CPU @ 2.90GHz  with  __attribute__((aligned(64)))

    txs	382	        aborts		406	        faileds	11	    capacities	8	    debugs	0	conflit	398	        zero	0
    txs	9938799	    aborts		11409631	faileds	62368	capacities	60973	debugs	0	conflit	11345870	zero	2788
    txs	10044216	aborts		11706596	faileds	61048	capacities	60203	debugs	0	conflit	11643725	zero	2668
    txs	10102177	aborts		11463549	faileds	60199	capacities	59161	debugs	0	conflit	11401893	zero	2495
    txs	10242518	aborts		12230484	faileds	62859	capacities	62507	debugs	0	conflit	12166668	zero	1309
    txs	10268156	aborts		12240786	faileds	65116	capacities	64658	debugs	0	conflit	12174662	zero	1467
    txs	10255116	aborts		12352714	faileds	60965	capacities	60643	debugs	0	conflit	12290737	zero	1333
    txs	10179717	aborts		12085221	faileds	54023	capacities	53597	debugs	0	conflit	12030123	zero	1501
    txs	10192107	aborts		12027243	faileds	58952	capacities	58206	debugs	0	conflit	11967365	zero	1672
    txs	10045203	aborts		11795694	faileds	52204	capacities	51631	debugs	0	conflit	11742077	zero	1986
    txs	10271984	aborts		12181318	faileds	57267	capacities	56898	debugs	0	conflit	12123164	zero	1256
    txs	9967581	    aborts		11467056	faileds	53035	capacities	52007	debugs	0	conflit	11412776	zero	2273
    txs	9984704	    aborts		11267512	faileds	61302	capacities	59626	debugs	0	conflit	11204323	zero	3565


    Microsoft Windows [Version 10.0.17134.345]  Intel(R) Core(TM) i7-7700 CPU @ 3.60GHz  without  __attribute__((aligned(64)))

    txs 22812008    aborts      91656       faileds 1839    capacities  1817    debugs  0   conflit 85155	    zero    4684
    txs 22680349    aborts      103298      faileds 1175    capacities  1160    debugs  0   conflit 98474	    zero    3664
    txs 22247197    aborts      101577      faileds 2080    capacities  2044    debugs  0   conflit 91360	    zero    8173
    txs 22366722    aborts      101092      faileds 942     capacities  928     debugs  0   conflit 96300	    zero    3863
    txs 22556846    aborts      96019       faileds 2445    capacities  2385    debugs  0   conflit 89333	    zero    4302
    txs 22508284    aborts      100531      faileds 1760    capacities  1737    debugs  0   conflit 90645	    zero    8149
    txs 22709019    aborts      95737       faileds 963     capacities  952     debugs  0   conflit 89047	    zero    5738
    txs 22617079    aborts      100150      faileds 845     capacities  833     debugs  0   conflit 95744	    zero    3573
    txs 22487583    aborts      98663       faileds 1165    capacities  1153    debugs  0   conflit 93646	    zero    3864
    txs 22537181    aborts      87534       faileds 1942    capacities  1888    debugs  0   conflit 81810	    zero    3836
    txs 23394449    aborts      91627       faileds 1441    capacities  1402    debugs  0   conflit 86781	    zero    3444
 */

int main(){
    int accounts = 10240;

    bank_t* bank = new bank_t;
    bank->accounts = new account_t[accounts];
    bank->size = accounts;

    for(int i=0; i<accounts; i++){
        bank->accounts[i].number = i;
        bank->accounts[i].balance = 0;
    }

    thread* pid[n_threads];
    tx = new long[n_threads];
    _abort = new long[n_threads];
    capacity = new long[n_threads];
    debug = new long[n_threads];
    failed = new long[n_threads];
    conflict = new long[n_threads];
    zero = new long[n_threads];

    thread* _heartbeat = new thread(f2);
    for(int i=0; i<n_threads; i++){
        tx[i] = _abort[i] = capacity[i] = debug[i] = failed[i] = conflict[i] = zero[i] =  0;
        pid[i] = new thread(f1, bank, i);
    }

// sleep(5);
    for(int i=0; i<n_threads;i++){
        pid[i]->join();
    }
    return 0;
}