//
// Created by Edward Hyde on 16/10/2018.
//

#include <iostream>
#include <vector>
#include <numeric>
#include <string>
#include <functional>
#include <thread>

#if defined(__USE_GNU) || defined(__MINGW32__)
    #include <atomic>
#endif

// Simulate mapreduce in cpp


bool THROW_ERROR  = true;

class scoped_thread {
private:
    std::thread t;
public:

    explicit scoped_thread(std::thread t_): t(std::move(t_)) {
        if(!t.joinable()) throw std::logic_error("No thread");
        else t.join();
    }

    // Destructor to join thread at the end of scope
    ~scoped_thread() { if(t.joinable()) t.join(); }

    // copying is no-op
    scoped_thread(scoped_thread const&)=delete;

    // copying is no-op
    scoped_thread& operator=(scoped_thread const&)=delete;
};

template<typename Iterator,typename T, typename R>
struct accumulate_block {
    /*
     *  first, last - first and last elements in container to process
     *  result - variable to store result of accumulate
     *  function - function to apply in accumulate
     *  expWasSet - signal that exception occurred during processing current block
     */
    void operator()(Iterator first,Iterator last,T& result, R function, std::exception_ptr& ptr, std::atomic<bool>& expWasSet) {
        try {
            // if exception was set by other thread - do not start processing new block
            if(expWasSet.load(std::memory_order_acquire)) return;
            // process block and store result in "result" var
            result = std::accumulate(first,last,result, function);
        }catch (...){
            // store exception in ptr
            ptr = std::current_exception();
            // notify other threads and parent thread that exception occurred
            expWasSet.store(true, std::memory_order_release);
        }
    }
};

template<typename Iterator,typename T, typename R, typename F>
T mapReduce(Iterator first,Iterator last,T init, R function, F reducer) {
    // variable to store exception from children threads
    static std::exception_ptr teptr = nullptr;
    // total number of elements to process
    long const length = std::distance(first, last);
    // no exception occurred at this point
    std::atomic<bool> expWasSet(false);
    // if length = 0 - return initial element
    if(!length) return init;
    // number of elements per thread
    unsigned long const min_per_thread = 25;
    // for 100 elements - (100 + 25 - 1) / 25 = 4.96 ~ 4 threads
    unsigned long const max_threads = (length + min_per_thread - 1) / min_per_thread;
    // number ot threads available on this machine
    unsigned long const hardware_threads = std::thread::hardware_concurrency();
    // choose smallest value from hardware_threads and max_threads
    unsigned long const num_threads = std::min(hardware_threads != 0 ? hardware_threads : 2, max_threads);
    // elements per thread
    unsigned long const block_size = length / num_threads;
    // results will be stored here
    std::vector<T> results(num_threads, init);
    // threads will be stored here
    std::vector<std::unique_ptr<scoped_thread>>  threads(num_threads);
    Iterator block_start = first;
    // start num_threads blocks in new threads
    for(unsigned long i = 0;i < (num_threads - 1); ++i) {
        Iterator block_end = block_start;
        // move iterator forward
        std::advance(block_end, block_size);
        // create processing thread
        // accumulate_block - wil process elements according to passed "function" and store result in "results[i]" or signal that exception occurred with "expWasSet" variable
        // scoped_thread - will hold thread and join it in constructor or destructor - guarantee that thread will not be lost
        // std::unique_ptr - will delete scoped_thread so no memory leak will occur
        threads.emplace(threads.begin() + i, std::unique_ptr<scoped_thread>(new scoped_thread(std::thread(accumulate_block<Iterator,T, R>(), block_start,block_end,std::ref(results[i]), function, std::ref(teptr), std::ref(expWasSet)))));
        // new block will be started from block_start element
        block_start = block_end;
        // check for exception before starting new block
        if(expWasSet.load(std::memory_order_acquire)) std::rethrow_exception(teptr);
    }
    // process remaining elements
    threads.emplace(threads.end(), std::unique_ptr<scoped_thread>(new scoped_thread(std::thread(accumulate_block<Iterator,T, R>(),block_start,last,std::ref(results[num_threads-1]), function, std::ref(teptr), std::ref(expWasSet)))));

    // check for exception
    if(expWasSet.load(std::memory_order_acquire)) std::rethrow_exception(teptr);

    // combine results from all blocks
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
