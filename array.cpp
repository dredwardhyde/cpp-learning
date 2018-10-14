//
// Created by Edward Hyde on 13/10/2018.
//

#include <iostream>
#include <iomanip>
#include <stdexcept>

#include "array.h"

//default constructor for class Array (default size 10)
template <typename T>
Array<T>::Array(int arraySize)
            : size{(arraySize > 0 ? static_cast<size_t>(arraySize) : throw std::invalid_argument{"Array size must be greater than 0"})},
            ptr{new T[size]{}}{
}

//copy constructor for class Array:
//must receive a reference to an Array
template <typename T>
Array<T>::Array(const Array& arrayToCopy)
            : size{arrayToCopy.size}, ptr{new T[size]} {
    for(size_t i{0} ; i < size; ++i){
        ptr[i] = arrayToCopy.ptr[i]; // copy into object
    }
}

//destructor for class Array
template <typename T>
Array<T>::~Array() {
    delete[] ptr;
}
template <typename T>
size_t Array<T>::getSize() const {
    return size;
}

//overloaded assignment operator
//const return avoids: (a1 = a2) = a3
template <typename T>
const Array<T>& Array<T>::operator=(const Array<T>& right) {
    if(&right != this){ //avoid self-assignment
        if(size != right.size) {
            //for Arrays of different sizes, deallocate original
            //left-side Array, then allocate new left-side Array
            delete [] ptr; //release space
            size = right.size; //resize this object
            ptr = new T[size]; //create space for Array copy
        }
        for( size_t i{0}; i < size; ++i){
            ptr[i] = right.ptr[i]; //copy array into object
        }
    }
    return *this; // enables x = y = z, for example
}
template <typename T>
bool Array<T>::operator==(const Array<T>& right) const {
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
template <typename T>
T& Array<T>::operator[](int subscript) {
    if(subscript < 0 || subscript >= size){
        throw std::out_of_range{"Subscript out of range"};
    }
    return ptr[subscript]; //return reference
}

template <typename T>
T Array<T>::operator[](int subscript) const {
    if(subscript < 0 || subscript >= size){
        throw std::out_of_range{"Subscript out of range"};
    }
    return ptr[subscript]; //return reference
}

template <typename U>
std::istream& operator>>(std::istream& input, Array<U>& a){

    for(size_t i{0}; i < a.size; ++i) {
        input >> a.ptr[i];
    }
    return input; //enables cin >> x >> y
}

template <typename U>
std::ostream& operator<<(std::ostream& output, const Array<U>& a){
    for(size_t i{0}; i < a.size; ++i){
        output << a.ptr[i] << "  ";
    }
    output << std::endl;
    return output; // enables cout << x << y
}

/*
    --------------------------INTEGER--------------------------
    Original: 0  0  0  0  0  0  0

    Modified: 1  0  0  5  0  0  0

    Copied: 1  0  0  5  0  0  0

    (copied == integers): 1

    Assigned from copied: 1  0  0  5  0  0  0

    Modified copied: 1  0  0  5  0  0  7

    --------------------------DOUBLE--------------------------
    Original: 0  0  0  0  0  0  0

    Modified: 1.5  0  0  5.7  0  0  0

    Copied: 1.5  0  0  5.7  0  0  0

    (copied == integers): 1

    Assigned from copied: 1.5  0  0  5.7  0  0  0

    Modified copied: 1.5  0  0  5.7  0  0  7.7
 */
int main() {

    std::cout <<"--------------------------INTEGER--------------------------" <<  std::endl;

    Array<int> integers{7};

    std::cout << "Original: " << integers << std::endl;

    integers[0] = 1;

    integers[3] = 5;

    std::cout << "Modified: " <<  integers << std:: endl;

    Array<int> copied{integers};

    std::cout << "Copied: " << copied << std:: endl;

    std::cout << "(copied == integers): " <<  (copied == integers) << std::endl << std::endl;

    Array<int> assigned = copied;

    copied[6] = 7;

    std::cout <<"Assigned from copied: " <<  assigned << std::endl;

    std::cout <<"Modified copied: " <<  copied << std::endl;

    std::cout <<"--------------------------DOUBLE--------------------------" <<  std::endl;

    Array<double> doubles{7};

    std::cout << "Original: " << doubles << std::endl;

    doubles[0] = 1.5;

    doubles[3] = 5.7;

    std::cout << "Modified: " <<  doubles << std:: endl;

    Array<double> copiedDoubles{doubles};

    std::cout << "Copied: " << copiedDoubles << std:: endl;

    std::cout << "(copied == integers): " <<  (copiedDoubles == doubles) << std::endl << std::endl;

    Array<double> assignedDoubles = copiedDoubles;

    copiedDoubles[6] = 7.7;

    std::cout <<"Assigned from copied: " <<  assignedDoubles << std::endl;

    std::cout <<"Modified copied: " <<  copiedDoubles << std::endl;

}