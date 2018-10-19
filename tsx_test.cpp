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

        std::this_thread::sleep_for(std::chrono::seconds(1));
    }
}

/*  macOS 10.13.6 (17G65) MacBook Pro 2017 Intel(R) Core(TM) i7-7820HQ CPU @ 2.90GHz  with  __attribute__((aligned(64)))

    txs	382	        aborts		406	        failed	11	    capacity	8	    debug	0	conflict	398	        zero	0
    txs	9938799	    aborts		11409631	failed	62368	capacity	60973	debug	0	conflict	11345870	zero	2788
    txs	10044216	aborts		11706596	failed	61048	capacity	60203	debug	0	conflict	11643725	zero	2668
    txs	10102177	aborts		11463549	failed	60199	capacity	59161	debug	0	conflict	11401893	zero	2495
    txs	10242518	aborts		12230484	failed	62859	capacity	62507	debug	0	conflict	12166668	zero	1309
    txs	10268156	aborts		12240786	failed	65116	capacity	64658	debug	0	conflict	12174662	zero	1467
    txs	10255116	aborts		12352714	failed	60965	capacity	60643	debug	0	conflict	12290737	zero	1333
    txs	10179717	aborts		12085221	failed	54023	capacity	53597	debug	0	conflict	12030123	zero	1501
    txs	10192107	aborts		12027243	failed	58952	capacity	58206	debug	0	conflict	11967365	zero	1672
    txs	10045203	aborts		11795694	failed	52204	capacity	51631	debug	0	conflict	11742077	zero	1986
    txs	10271984	aborts		12181318	failed	57267	capacity	56898	debug	0	conflict	12123164	zero	1256
    txs	9967581	    aborts		11467056	failed	53035	capacity	52007	debug	0	conflict	11412776	zero	2273
    txs	9984704	    aborts		11267512	failed	61302	capacity	59626	debug	0	conflict	11204323	zero	3565

    macOS 10.13.6 (17G65) MacBook Pro 2017 Intel(R) Core(TM) i7-7820HQ CPU @ 2.90GHz  without  __attribute__((aligned(64)))

    txs	382	        aborts		435	        failed	7	    capacity	6	    debug	0	conflict	429	        zero	0
    txs	9914805	    aborts		11433580	failed	147347	capacity	146475	debug	0	conflict	11283945	zero	3160
    txs	10233735	aborts		11063411	failed	157595	capacity	156086	debug	0	conflict	10902825	zero	4500
    txs	9852471	    aborts		11659267	failed	159909	capacity	159337	debug	0	conflict	11497435	zero	2495
    txs	10079455	aborts		11959584	failed	161886	capacity	161400	debug	0	conflict	11796161	zero	2023
    txs	10089464	aborts		11871225	failed	149372	capacity	148824	debug	0	conflict	11719350	zero	3051
    txs	10201504	aborts		12223146	failed	143450	capacity	143215	debug	0	conflict	12078538	zero	1394
    txs	9929631	    aborts		11604689	failed	141718	capacity	140985	debug	0	conflict	11461114	zero	2589
    txs	9995103	    aborts		11817224	failed	130237	capacity	129785	debug	0	conflict	11684999	zero	2440
    txs	10039205	aborts		11850755	failed	140056	capacity	139586	debug	0	conflict	11709253	zero	1916
    txs	9891612	    aborts		11587555	failed	140469	capacity	139802	debug	0	conflict	11444618	zero	3135
    txs	10056375	aborts		11979285	failed	138719	capacity	138402	debug	0	conflict	11839034	zero	1849
    txs	10009238	aborts		11831077	failed	126188	capacity	125854	debug	0	conflict	11702052	zero	3171
    txs	10049117	aborts		11906881	failed	134574	capacity	134260	debug	0	conflict	11770969	zero	1652
    txs	10022979	aborts		11755648	failed	114815	capacity	114490	debug	0	conflict	11639463	zero	1695
    txs	10130644	aborts		12047694	failed	145462	capacity	145119	debug	0	conflict	11900804	zero	1772


    Microsoft Windows [Version 10.0.17134.345]  Intel(R) Core(TM) i7-7700 CPU @ 3.60GHz  without  __attribute__((aligned(64)))

    txs 22812008    aborts      91656       failed 1839    capacity  1817    debug  0   conflict 85155	    zero    4684
    txs 22680349    aborts      103298      failed 1175    capacity  1160    debug  0   conflict 98474	    zero    3664
    txs 22247197    aborts      101577      failed 2080    capacity  2044    debug  0   conflict 91360	    zero    8173
    txs 22366722    aborts      101092      failed 942     capacity  928     debug  0   conflict 96300	    zero    3863
    txs 22556846    aborts      96019       failed 2445    capacity  2385    debug  0   conflict 89333	    zero    4302
    txs 22508284    aborts      100531      failed 1760    capacity  1737    debug  0   conflict 90645	    zero    8149
    txs 22709019    aborts      95737       failed 963     capacity  952     debug  0   conflict 89047	    zero    5738
    txs 22617079    aborts      100150      failed 845     capacity  833     debug  0   conflict 95744	    zero    3573
    txs 22487583    aborts      98663       failed 1165    capacity  1153    debug  0   conflict 93646	    zero    3864
    txs 22537181    aborts      87534       failed 1942    capacity  1888    debug  0   conflict 81810	    zero    3836
    txs 23394449    aborts      91627       failed 1441    capacity  1402    debug  0   conflict 86781	    zero    3444
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