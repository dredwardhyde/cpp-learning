//
// Created by Edward Hyde on 2019-01-24.
//

#include <iostream>
#include <string>

class Product {
    private:
        std::string name;
        std::string price;
    public:
        Product(std::string name, std::string price) : name(std::move(name)), price(std::move(price)){ }
        bool operator == (const Product &p2){
            return (this -> name == p2.name && this -> price == p2.price);
        }
        bool operator != (const Product &p2){
            return !(*this == p2);
        }
};

int main() {
    Product product1 ("Name", "100");
    Product product2 ("Name", "1000");
    if (product1 == product2) std::cout << "a product1 and product2 are the same.\n";
    if (product1 != product2 ) std::cout << "a product1 and product2 are not the same.\n";
    return 0;
}