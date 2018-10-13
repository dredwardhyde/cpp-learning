//
// Created by Edward Hyde on 13/10/2018.
//

#include <iostream>
#include <iomanip>
#include <stdexcept>

#include "array.h"

//default constructor for class Array (default size 10)
Array::Array(int arraySize)
            : size{(arraySize > 0 ? static_cast<size_t>(arraySize) : throw std::invalid_argument{"Array size must be greater than 0"})},
            ptr{new int[size]{}}{
}

//copy constructor for class Array:
//must receive a reference to an Array
Array::Array(const Array& arrayToCopy)
            : size{arrayToCopy.size}, ptr{new int[size]} {
    for(size_t i{0} ; i < size; ++i){
        ptr[i] = arrayToCopy.ptr[i]; // copy into object
    }
}

//destructor for class Array
Array::~Array() {
    delete[] ptr;
}

size_t Array::getSize() const {
    return size;
}

//overloaded assignment operator
//const return avoids: (a1 = a2) = a3
const Array& Array::operator=(const Array& right) {
    if(&right != this){ //avoid self-assignment
        if(size != right.size) {
            //for Arrays of different sizes, deallocate original
            //left-side Array, then allocate new left-side Array
            delete [] ptr; //release space
            size = right.size; //resize this object
            ptr = new int[size]; //create space for Array copy
        }
        for( size_t i{0}; i < size; ++i){
            ptr[i] = right.ptr[i]; //copy array into object
        }
    }
    return *this; // enables x = y = z, for example
}

bool Array::operator==(const Array & right) const {
    if(size != right.size){
        return false; //arrays of different number of elements
    }

    for(size_t i{0}; i < size; ++i){
        if(ptr[i] != right.ptr[i]) {
            return false;
        }
    }

    return true;
}

int& Array::operator[](int subscript) {
    if(subscript < 0 || subscript >= size){
        throw std::out_of_range{"Subscript out of range"};
    }
    return ptr[subscript]; //return reference
}

int Array::operator[](int subscript) const {
    if(subscript < 0 || subscript >= size){
        throw std::out_of_range{"Subscript out of range"};
    }
    return ptr[subscript]; //return reference
}

std::istream& operator>>(std::istream& input, Array& a){

    for(size_t i{0}; i < a.size; ++i) {
        input >> a.ptr[i];
    }
    return input; //enables cin >> x >> y
}

std::ostream& operator<<(std::ostream& output, const Array& a){
    for(size_t i{0}; i < a.size; ++i){
        output << a.ptr[i] << "  ";
    }
    output << std::endl;
    return output; // enables cout << x << y
}

/*
    Original: 0  0  0  0  0  0  0

    Modified: 1  0  0  5  0  0  0

    Copied: 1  0  0  5  0  0  0

    (copied == integers): 1

    Assigned from copied: 1  0  0  5  0  0  0

    Modified copied: 1  0  0  5  0  0  7
 */
int main() {
    Array integers{7};
    std::cout << "Original: " << integers << std::endl;

    integers[0] = 1;
    integers[3] = 5;

    std::cout << "Modified: " <<  integers << std:: endl;

    Array copied{integers};

    std::cout << "Copied: " << copied << std:: endl;

    std::cout << "(copied == integers): " <<  (copied == integers) << std::endl << std::endl;

    Array assigned = copied;

    copied[6] = 7;

    std::cout <<"Assigned from copied: " <<  assigned << std::endl;

    std::cout <<"Modified copied: " <<  copied << std::endl;

}