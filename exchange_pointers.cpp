//
// Created by Edward Hyde on 05/11/2018.
//

#include <cstdint>
#include <iostream>

struct node;

struct counted_node_ptr {
    int external_count; // 32 bit
    int padding; // 32 bit
    node* ptr; //64 bit
};

struct node {
    int x, y, z;
    node(){
        x = 1;
        y = 2;
        z = 3;
    }
};

inline uint64_t casPointers(volatile uint64_t* ptr, uint64_t old_val, uint64_t new_val) {
    uint64_t ret_val;
    __asm__ __volatile__("lock cmpxchgq %1,%2"
    :"=a"(ret_val)
    :"r"(new_val), "m"(*ptr), "0"(old_val)
    :"memory"
    );
    return ret_val;
}

int main(){
    counted_node_ptr counter = { 1, 0, nullptr};
    auto node1 = new node();
    std::cout << "Before: " << counter.ptr << std::endl;
    std::cout << "Goal: " << node1 << std::endl;
    node* empty = nullptr;

    if(casPointers((uint64_t*)(&counter.ptr), (uint64_t)empty, (uint64_t)node1) != 0){
        delete  node1;
    }

    std::cout << "After: " << counter.ptr << std::endl;
    std::cout << "Goal: " << node1 << std::endl;
    if(counter.ptr == node1) std::cout << "set" << std::endl;
    std::cout << counter.ptr->x << std::endl;

}