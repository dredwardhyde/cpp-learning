//
// Created by Edward Hyde on 13/10/2018.
//

#ifndef CPP_LEARNING_ARRAY_H
#define CPP_LEARNING_ARRAY_H

#include <iostream>

template <typename T>
class Array {
    template <typename U>
    friend std::ostream& operator<<(std::ostream&, const Array<U>&);
    template <typename U>
    friend std::istream& operator>>(std::istream&, Array<U>&);

public:
    explicit Array<T>(int = 10); //default constructor
    Array<T>(const Array&); //copy constructor
    ~Array<T>(); //destructor
    size_t getSize() const ; // return size

    const Array<T>& operator=(const Array<T>&); //assignment operator
    bool operator==(const Array&) const; //equality operator

    bool operator!=(const Array<T>& right) const {
        return ! (*this == right); // invokes Array::operator==
    }

    // subscript operator for non-const objects returns modifiable lvalue
    T& operator[](int);

    //subscript operator for const objects returns rvalue
    T operator[](int) const;
private:
    size_t size;
    T* ptr;
};

#endif //CPP_LEARNING_ARRAY_H
