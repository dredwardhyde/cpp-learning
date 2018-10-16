//
// Created by Edward Hyde on 15/10/2018.
//

#include <thread>
#include <iostream>
#include <vector>

class thread_guard {
private:
    std::thread& t;
public:
    explicit thread_guard(std::thread& t_): t(t_) {}
    ~thread_guard() {
        std::cout << "Destructor called\n";
        if(t.joinable()) {
            std::cout << "Joined\n";
            t.join();
        }
    }
    thread_guard(thread_guard const&)=delete;
    thread_guard& operator=(thread_guard const&)=delete;
};

class scoped_thread {
private:
    std::thread t;
public:
    explicit scoped_thread(std::thread t_): t(std::move(t_)) {
        if(!t.joinable()) throw std::logic_error("No thread");
    }
    ~scoped_thread() {
        std::cout << "Joined\n";
        t.join();
    }
    scoped_thread(scoped_thread const&)=delete;
    scoped_thread& operator=(scoped_thread const&)=delete;
};


void print(std::string& str){
    std::cout << str;
}

void printInt(int i){
    std::cout << std::to_string(i) + " ";
}

void printMain(){
    std::cout << "From main thread\n";
    throw std::runtime_error("Exception from main");
}

/*
    The destructor is not being called because terminate() for the unhandled exception is called before the stack gets unwound.
    According to the draft standard section 15.3 bullet 9:
        9 If no matching handler is found in a program, the function terminate()
          (_except.terminate_)  is  called.  Whether or not the stack is unwound
          before calling terminate() is implementation-defined.
 */
int main(){

    std::cout << "thread_guard without std::moving of thread" << std::endl;
    try {
        std::string str = "From child thread\n";
        std::thread t(print, std::ref(str));
        thread_guard g(t);
        printMain();
    }catch (std::exception& e){
        std::cout << e.what() << std::endl;
    }

    std::cout  << std::endl << "scoped_thread with std::moving of thread" << std::endl;
    try {
        std::string str = "From child thread\n";
        scoped_thread g(std::thread(print, std::ref(str)));
        printMain();
    }catch (std::exception& e){
        std::cout << e.what() << std::endl;
    }

    std::cout << "Hardware threads: " << std::thread::hardware_concurrency() << std::endl;

    //Join to multiple threads
    std::vector<std::thread> threadPool;
    for(unsigned int i = 0;i < 20; ++i) {
        threadPool.emplace_back(std::thread(printInt, i));
    }
    std::for_each(threadPool.begin(),threadPool.end(), std::mem_fn(&std::thread::join));
}