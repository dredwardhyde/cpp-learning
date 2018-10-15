//
// Created by Edward Hyde on 15/10/2018.
//

#include <thread>
#include <iostream>

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


void printChild(){
    std::cout << "From new thread\n";
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
    try {
        std::thread t(printChild);
        thread_guard g(t);
        printMain();
    }catch (std::exception& e){
        std::cout << e.what() << std::endl;
    }
}