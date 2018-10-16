//
// Created by Edward Hyde on 16/10/2018.
//

#include <iostream>
#include <vector>
#include <numeric>
#include <string>
#include <functional>
#include <thread>

template<typename Iterator,typename T, typename R>
struct accumulate_block {
    void operator()(Iterator first,Iterator last,T& result, R function) {
        result=std::accumulate(first,last,result, function);
    }
};

template<typename Iterator,typename T, typename R, typename F>
T mapReduce(Iterator first,Iterator last,T init, R function, F reducer) {
    long const length=std::distance(first,last);
    if(!length) return init;
    unsigned long const min_per_thread=25;
    unsigned long const max_threads= (length+min_per_thread-1)/min_per_thread;
    unsigned long const hardware_threads= std::thread::hardware_concurrency();
    unsigned long const num_threads= std::min(hardware_threads!=0?hardware_threads:2,max_threads);
    unsigned long const block_size=length/num_threads;
    std::vector<T> results(num_threads, init);
    std::vector<std::thread>  threads(num_threads);
    Iterator block_start=first;
    std::cout << "Mappers spawned: " << num_threads << " (in new threads: " << (num_threads - 1) << ")" << std::endl;
    std::cout << "Mapping main blocks in new threads with size " << block_size << "" << std::endl;
    for(unsigned long i=0;i<(num_threads-1);++i) {
        Iterator block_end=block_start;
        std::advance(block_end,block_size);
        threads[i]=std::thread(accumulate_block<Iterator,T, R>(),
        block_start,block_end,std::ref(results[i]), function);
        block_start=block_end;
    }
    threads[num_threads-1]=std::thread(accumulate_block<Iterator,T, R>(),block_start,last,std::ref(results[num_threads-1]), function);
    std::for_each(threads.begin(),threads.end(), std::mem_fn(&std::thread::join));
    return std::accumulate(results.begin(), results.end(), init, reducer);
}

int main() {

    unsigned long count = 100;

    std::function<std::string(std::string, long)> mapper = [] (std::string a, long b) -> std::string {
        if(a.empty())
            return std::to_string(b);
        return a + '-' + std::to_string(b);
    };

    std::function<std::string(std::string, std::string)> reducer = [] (std::string a, std::string b) -> std::string {
        if(a.empty())
            return b;
        return a + '-' + b;
    };

    std::vector<long> v(count);
    for(unsigned long i = 0; i < count; i++){
        v.at(i) = i + 1;
    }

    std::cout << "Serial accumulate" << std::endl;
    long sum = std::accumulate(v.begin(), v.end(), 0l);
    std::string s = std::accumulate(std::next(v.begin()), v.end(), std::to_string(v[0]), mapper);
    std::cout << "sum: " << sum << '\n' << "dash-separated string: " << s << '\n'<< '\n';

    std::cout << "Parallel accumulate" << std::endl;
    long sumParallel = mapReduce(v.begin(), v.end(), 0l, std::plus<long>(), std::plus<long>());
    std::string sParallel = mapReduce (v.begin(), v.end(), std::string(""), mapper, reducer);
    std::cout << "sum: " << sumParallel << '\n' << "dash-separated string: " << sParallel << '\n';
}
