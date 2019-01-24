#ifdef _MSC_VER
    #include <vld.h>
#endif
#include <atomic>
#include <memory>
#include <chrono>
#include <iostream>
#include <thread>

//inline uint64_t casPointers(volatile uint64_t* ptr, uint64_t old_val, uint64_t new_val) {
//    uint64_t ret_val;
//    __asm__ __volatile__("lock cmpxchgq %1,%2"
//    :"=a"(ret_val)
//    :"r"(new_val), "m"(*ptr), "0"(old_val)
//    :"memory"
//    );
//    return ret_val;
//}

template<typename T>
class lock_free_queue {
private:
    struct node;

    struct counted_node_ptr {
        int external_count; // 32 bit
        int padding; // 32 bit
        node* ptr; //64 bit
    };

    struct node_counter {
        int internal_count:30;
        unsigned external_counters:2;
    };

    struct node {
        std::atomic<T*> data;
        std::atomic<node_counter> count;
        std::atomic<counted_node_ptr> next;

        node() {
            node_counter new_count = {0, 2};
            count.store(new_count);
            data = nullptr;
            counted_node_ptr next_node = {0, 0, nullptr};
            next.store(next_node);
        }

        void release_ref() {
            node_counter old_counter = count.load(std::memory_order_relaxed);
            node_counter new_counter;
            do {
                new_counter = old_counter;
                --new_counter.internal_count;
            } while(!count.compare_exchange_strong(old_counter,new_counter, std::memory_order_acquire,std::memory_order_relaxed));

            if(!new_counter.internal_count && !new_counter.external_counters) {
                delete this;
            }
        }
    };

    std::atomic<counted_node_ptr> head;
    std::atomic<counted_node_ptr> tail;

    static void increase_external_count(std::atomic<counted_node_ptr>& counter, counted_node_ptr& old_counter) {
        counted_node_ptr new_counter;
        do {
            new_counter = old_counter;
            ++new_counter.external_count;
        } while(!counter.compare_exchange_strong(old_counter,new_counter, std::memory_order_acquire, std::memory_order_relaxed));
        old_counter.external_count=new_counter.external_count;
    }

    void set_new_tail(counted_node_ptr &old_tail, counted_node_ptr const &new_tail) {
        node* const current_tail_ptr = old_tail.ptr;
        while(!tail.compare_exchange_weak(old_tail,new_tail) && old_tail.ptr == current_tail_ptr);
        if(old_tail.ptr == current_tail_ptr) {
            free_external_counter(old_tail);
        } else {
            current_tail_ptr->release_ref();
        }
    }

    static void free_external_counter(counted_node_ptr &old_node_ptr) {
        node* const ptr = old_node_ptr.ptr;
        int const count_increase = old_node_ptr.external_count-2;
        node_counter old_counter = ptr->count.load(std::memory_order_relaxed);
        node_counter new_counter;
        do {
            new_counter = old_counter;
            --new_counter.external_counters;
            new_counter.internal_count += count_increase;
        } while(!ptr->count.compare_exchange_strong(old_counter,new_counter, std::memory_order_acquire,std::memory_order_relaxed));
        if(!new_counter.internal_count && !new_counter.external_counters) {
            delete ptr;
        }
    }

public:
    lock_free_queue() {
        counted_node_ptr new_node = {1, 0, new node};
        head.store(new_node);
        tail.store(head.load());
    }

    lock_free_queue(const lock_free_queue& other) = delete;
    lock_free_queue& operator=(const lock_free_queue& other) = delete;

    ~lock_free_queue() {
        while(pop());
        delete head.load().ptr;
    }
    std::unique_ptr<T> pop() {
        counted_node_ptr old_head = head.load(std::memory_order_relaxed);
        for(;;) {
            increase_external_count(head,old_head);
            node* const ptr = old_head.ptr;
            if(ptr == tail.load().ptr) {
                return std::unique_ptr<T>();
            }
            counted_node_ptr next = ptr->next.load();
            if(head.compare_exchange_strong(old_head,next)) {
                T* const res = ptr->data.exchange(nullptr);
                free_external_counter(old_head);
                return std::unique_ptr<T>(res);
            }
            ptr->release_ref();
        }
    }

    void push(T new_value) {
        std::unique_ptr<T> new_data(new T(new_value));
        counted_node_ptr new_next = { 1, 0, new node};
        counted_node_ptr old_tail = tail.load();

        for(;;) {
            increase_external_count(tail,old_tail);
            T* old_data = nullptr;
            if(old_tail.ptr->data.compare_exchange_strong(old_data,new_data.get())) {
                counted_node_ptr old_next = {0, 0, nullptr};
                if(!old_tail.ptr->next.compare_exchange_strong(old_next,new_next)) {
                    delete new_next.ptr;
                    new_next = old_next;
                }
                set_new_tail(old_tail, new_next);
                new_data.release();
                break;
            } else {
                counted_node_ptr old_next = {0, 0, nullptr};
                if(old_tail.ptr->next.compare_exchange_strong(old_next,new_next)) {
                    old_next = new_next;
                    new_next.ptr = new node;
                }
                set_new_tail(old_tail, old_next);
            }
        }
    }
};

void producer(lock_free_queue<int>* stack){
    for(int i = 0; i < 1000;i++){
        stack->push(i);
    }
}

void consumer(lock_free_queue<int>* stack){
    while(std::unique_ptr<int> res = stack->pop()){
        //std::cout << *res << std:: endl;
    }
}
/*
 *  Visual Leak Detector read settings from: C:\Program Files (x86)\Visual Leak Detector\vld.ini
    Visual Leak Detector Version 2.5.1 installed.
    Pushing: 36984289
    Popping: 285
    WARNING: Visual Leak Detector detected memory leaks!
    ---------- Block 9767 at 0x00000000E9D81730: 40 bytes ----------
      Leak Hash: 0x5BC9CD4E, Count: 1, Total 40 bytes
      Call Stack (TID 19396):
        ucrtbased.dll!malloc()
        f:\dd\vctools\crt\vcstartup\src\heap\new_scalar.cpp (19): lock_free_queue.exe!operator new() + 0xA bytes
        c:\users\tony\cpp-learning\lock_free_queue.cpp (124): lock_free_queue.exe!lock_free_queue<int>::push() + 0x1A bytes
        c:\users\tony\cpp-learning\lock_free_queue.cpp (155): lock_free_queue.exe!producer()
        c:\program files (x86)\microsoft visual studio 14.0\vc\include\type_traits (1377): lock_free_queue.exe!std::_Invoker_functor::_Call<void (__cdecl*)(lock_free_queue<int> * __ptr64),std::reference_wrapper<lock_free_queue<int> * __ptr64> >()
        c:\program files (x86)\microsoft visual studio 14.0\vc\include\type_traits (1445): lock_free_queue.exe!std::invoke<void (__cdecl*)(lock_free_queue<int> * __ptr64),std::reference_wrapper<lock_free_queue<int> * __ptr64> >()
        c:\program files (x86)\microsoft visual studio 14.0\vc\include\thr\xthread (241): lock_free_queue.exe!std::_LaunchPad<std::unique_ptr<std::tuple<void (__cdecl*)(lock_free_queue<int> * __ptr64),std::reference_wrapper<lock_free_queue<int>* __ptr64> >,std::default_delete<std::tuple<void (__cdecl*)(lock_free_queue<int> * __ptr64),std::reference_wrapper<lock_()
        c:\program files (x86)\microsoft visual studio 14.0\vc\include\thr\xthread (250): lock_free_queue.exe!std::_LaunchPad<std::unique_ptr<std::tuple<void (__cdecl*)(lock_free_queue<int> * __ptr64),std::reference_wrapper<lock_free_queue<int>* __ptr64> >,std::default_delete<std::tuple<void (__cdecl*)(lock_free_queue<int> * __ptr64),std::reference_wrapper<lock_()
        c:\program files (x86)\microsoft visual studio 14.0\vc\include\thr\xthread (233): lock_free_queue.exe!std::_LaunchPad<std::unique_ptr<std::tuple<void (__cdecl*)(lock_free_queue<int> * __ptr64),std::reference_wrapper<lock_free_queue<int>* __ptr64> >,std::default_delete<std::tuple<void (__cdecl*)(lock_free_queue<int> * __ptr64),std::reference_wrapper<lock_()
        c:\program files (x86)\microsoft visual studio 14.0\vc\include\thr\xthread (210): lock_free_queue.exe!std::_Pad::_Call_func()
        ucrtbased.dll!register_onexit_function() + 0x4A8 bytes
        ucrtbased.dll!register_onexit_function() + 0x111 bytes
        KERNEL32.DLL!BaseThreadInitThunk() + 0x14 bytes
        ntdll.dll!RtlUserThreadStart() + 0x21 bytes
      Data:
        00 00 00 00    00 00 00 00    02 00 00 00    CD CD CD CD     ........ ........
        00 00 00 00    CD CD CD CD    01 00 00 00    00 00 00 00     ........ ........
        90 1B D8 E9    46 02 00 00                                   ....F... ........


    ---------- Block 9766 at 0x00000000E9D817A0: 40 bytes ----------
      Leak Hash: 0x5BC9CD4E, Count: 1, Total 40 bytes
      Call Stack (TID 21908):
        ucrtbased.dll!malloc()
        f:\dd\vctools\crt\vcstartup\src\heap\new_scalar.cpp (19): lock_free_queue.exe!operator new() + 0xA bytes
        c:\users\tony\cpp-learning\lock_free_queue.cpp (124): lock_free_queue.exe!lock_free_queue<int>::push() + 0x1A bytes
        c:\users\tony\cpp-learning\lock_free_queue.cpp (155): lock_free_queue.exe!producer()
        c:\program files (x86)\microsoft visual studio 14.0\vc\include\type_traits (1377): lock_free_queue.exe!std::_Invoker_functor::_Call<void (__cdecl*)(lock_free_queue<int> * __ptr64),std::reference_wrapper<lock_free_queue<int> * __ptr64> >()
        c:\program files (x86)\microsoft visual studio 14.0\vc\include\type_traits (1445): lock_free_queue.exe!std::invoke<void (__cdecl*)(lock_free_queue<int> * __ptr64),std::reference_wrapper<lock_free_queue<int> * __ptr64> >()
        c:\program files (x86)\microsoft visual studio 14.0\vc\include\thr\xthread (241): lock_free_queue.exe!std::_LaunchPad<std::unique_ptr<std::tuple<void (__cdecl*)(lock_free_queue<int> * __ptr64),std::reference_wrapper<lock_free_queue<int>* __ptr64> >,std::default_delete<std::tuple<void (__cdecl*)(lock_free_queue<int> * __ptr64),std::reference_wrapper<lock_()
        c:\program files (x86)\microsoft visual studio 14.0\vc\include\thr\xthread (250): lock_free_queue.exe!std::_LaunchPad<std::unique_ptr<std::tuple<void (__cdecl*)(lock_free_queue<int> * __ptr64),std::reference_wrapper<lock_free_queue<int>* __ptr64> >,std::default_delete<std::tuple<void (__cdecl*)(lock_free_queue<int> * __ptr64),std::reference_wrapper<lock_()
        c:\program files (x86)\microsoft visual studio 14.0\vc\include\thr\xthread (233): lock_free_queue.exe!std::_LaunchPad<std::unique_ptr<std::tuple<void (__cdecl*)(lock_free_queue<int> * __ptr64),std::reference_wrapper<lock_free_queue<int>* __ptr64> >,std::default_delete<std::tuple<void (__cdecl*)(lock_free_queue<int> * __ptr64),std::reference_wrapper<lock_()
        c:\program files (x86)\microsoft visual studio 14.0\vc\include\thr\xthread (210): lock_free_queue.exe!std::_Pad::_Ca
    ll_func()
        ucrtbased.dll!register_onexit_function() + 0x4A8 bytes
        ucrtbased.dll!register_onexit_function() + 0x111 bytes
        KERNEL32.DLL!BaseThreadInitThunk() + 0x14 bytes
        ntdll.dll!RtlUserThreadStart() + 0x21 bytes
      Data:
        00 00 00 00    00 00 00 00    01 00 00 00    CD CD CD CD     ........ ........
        00 00 00 00    CD CD CD CD    01 00 00 00    00 00 00 00     ........ ........
        30 17 D8 E9    46 02 00 00                                   0...F... ........

        Visual Leak Detector detected 2 memory leaks (184 bytes).
        Largest number used: 452988 bytes.
        Total allocations: 888804 bytes.
        Visual Leak Detector is now exiting.



    However on Ubuntu 18.04 with clang - nothing found - no exceptions, no leaks

    clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)
    Target: x86_64-pc-linux-gnu
    Thread model: posix
    InstalledDir: /usr/bin

    tony@tony-XPS-13-9360:~/Development/github/cpp-learning$ clang++-6.0 -stdlib=libc++ -march=native -fsanitize=address -g lock_free_queue.cpp ; ASAN_OPTIONS=detect_leaks=1 ./a.out
    Pushing: 6428670
    Popping: 159
 */
int main(){
    auto* queue = new lock_free_queue<int>();
    auto start = std::chrono::high_resolution_clock::now();
    std::thread a(producer, std::ref(queue));
    std::thread b(producer, std::ref(queue));
    std::thread e(producer, std::ref(queue));
    a.join();
    b.join();
    e.join();
    std::thread j(producer, std::ref(queue));
    std::thread k(producer, std::ref(queue));
    std::thread l(producer, std::ref(queue));
    std::thread c(consumer, std::ref(queue));
    std::thread d(consumer, std::ref(queue));
    std::thread f(consumer, std::ref(queue));
    c.join();
    d.join();
    f.join();
    j.join();
    k.join();
    l.join();
    auto done = std::chrono::high_resolution_clock::now();
    long resultTime = std::chrono::duration_cast<std::chrono::nanoseconds>(done - start).count();
    std::cout << "Pushing: " << resultTime << std::endl;
    start = std::chrono::high_resolution_clock::now();

    done = std::chrono::high_resolution_clock::now();
    resultTime = std::chrono::duration_cast<std::chrono::nanoseconds>(done - start).count();
    std::cout << "Popping: " << resultTime << std::endl;
    delete queue;
}
