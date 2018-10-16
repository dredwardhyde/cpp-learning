//
// Created by Edward Hyde on 16/10/2018.
//

#include <iostream>
#include <vector>
#include <numeric>
#include <string>
#include <functional>
#include <thread>

bool THROW_ERROR  = false;

class scoped_thread {
private:
    std::thread t;
public:
    explicit scoped_thread(std::thread t_): t(std::move(t_)) {
        if(!t.joinable()) throw std::logic_error("No thread");
        else t.join();
    }
    ~scoped_thread() { if(t.joinable()) t.join(); }
    scoped_thread(scoped_thread const&)=delete;
    scoped_thread& operator=(scoped_thread const&)=delete;
};

template<typename Iterator,typename T, typename R>
struct accumulate_block {
    void operator()(Iterator first,Iterator last,T& result, R function, std::exception_ptr& ptr) {
        try {
            if(ptr) return;
            result = std::accumulate(first,last,result, function);
        }catch (...){
            ptr = std::current_exception();
        }
    }
};

template<typename Iterator,typename T, typename R, typename F>
T mapReduce(Iterator first,Iterator last,T init, R function, F reducer) {
    static std::exception_ptr teptr = nullptr;
    long const length = std::distance(first, last);
    if(!length) return init;
    unsigned long const min_per_thread = 25;
    unsigned long const max_threads = (length+min_per_thread - 1) / min_per_thread;
    unsigned long const hardware_threads = std::thread::hardware_concurrency();
    unsigned long const num_threads = std::min(hardware_threads != 0 ? hardware_threads : 2, max_threads);
    unsigned long const block_size = length / num_threads;
    std::vector<T> results(num_threads, init);
    std::vector<std::unique_ptr<scoped_thread>>  threads(num_threads);
    Iterator block_start = first;
    for(unsigned long i = 0;i < (num_threads - 1); ++i) {
        Iterator block_end = block_start;
        std::advance(block_end, block_size);
        threads.emplace(threads.begin() + i, std::unique_ptr<scoped_thread>(new scoped_thread(std::thread(accumulate_block<Iterator,T, R>(), block_start,block_end,std::ref(results[i]), function, std::ref(teptr)))));
        block_start = block_end;
        if(teptr) std::rethrow_exception(teptr);
    }
    threads.emplace(threads.end(), std::unique_ptr<scoped_thread>(new scoped_thread(std::thread(accumulate_block<Iterator,T, R>(),block_start,last,std::ref(results[num_threads-1]), function, std::ref(teptr)))));
    if(teptr) std::rethrow_exception(teptr);
    return std::accumulate(results.begin(), results.end(), init, reducer);
}

int main() {
    try {
        unsigned long count = 100;

        std::function<std::string(std::string, long)> mapperParallel = [](std::string a, long b) -> std::string {
            if (a.empty())
                return std::to_string(b);
            if (b == 32 && THROW_ERROR) throw std::runtime_error("Exception from lambda");
            return a + '-' + std::to_string(b);
        };

        std::function<std::string(std::string, long)> mapperSerial = [](std::string a, long b) -> std::string {
            if (a.empty())
                return std::to_string(b);
            return a + '-' + std::to_string(b);
        };

        std::function<std::string(std::string, std::string)> reducer = [](std::string a, std::string b) -> std::string {
            if (a.empty())
                return b;
            return a + '-' + b;
        };

        std::vector<long> v(count);
        for (unsigned long i = 0; i < count; i++) {
            v.at(i) = i + 1;
        }

        std::cout << "Serial accumulate" << std::endl;
        long sum = std::accumulate(v.begin(), v.end(), 0l);
        std::string s = std::accumulate(std::next(v.begin()), v.end(), std::to_string(v[0]), mapperSerial);
        std::cout << "sum: " << sum << '\n' << "dash-separated string: " << s << '\n' << '\n';

        std::cout << "Parallel accumulate" << std::endl;
        long sumParallel = mapReduce(v.begin(), v.end(), 0l, std::plus<long>(), std::plus<long>());
        std::string sParallel = mapReduce(v.begin(), v.end(), std::string(""), mapperParallel, reducer);
        std::cout << "sum: " << sumParallel << '\n' << "dash-separated string: " << sParallel << '\n';
    }catch (std::exception& e){
        std::cout << "Caught in main:" << e.what() << std::endl;
    }
}
