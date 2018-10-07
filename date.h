//
// Created by Edward Hyde on 07/10/2018.
//

#ifndef CPP_LEARNING_DATE_H
#define CPP_LEARNING_DATE_H

#include <array>
#include <iostream>

class date {
    friend std::ostream& operator<<(std::ostream&, const date&);
public:
    date(int m = 1, int d = 1, int y = 1900);
    void setDate(int, int, int);
    date& operator++(); //prefix increment
    date operator++(int); //postfix increment
    date& operator+=(unsigned int);
    static bool leapYear(int);
    bool endOfMonth(int) const;

private:
    unsigned int month;
    unsigned int day;
    unsigned int year;

    static const std::array<unsigned int, 13> days;
    void helpIncrement();
};

#endif //CPP_LEARNING_DATE_H
