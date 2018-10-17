//
// Created by Edward Hyde on 17/10/2018.
//

#include <mutex>
#include <thread>
#include <iostream>
#include <vector>
#include <functional>
#include <chrono>
#include <string>

struct Account {
    Account(std::string id) : id(id), amount{0.0f} {}
    std::string id;
    double amount;
    std::vector<std::string> transactions;
    std::mutex m;
    std::string output() const {
        std::string ret = "Account " + id + " has transactions: ";
        for( const auto& transaction : transactions )
            ret += transaction + " ";
        ret += " current: " + std::to_string(amount);
        return ret;
    }
};

void transfer_money(Account &from, Account &to, double amount) {
    std::lock(from.m, to.m);
    std::lock_guard<std::mutex> lk1(from.m, std::adopt_lock);
    std::lock_guard<std::mutex> lk2(to.m, std::adopt_lock);
    std::cout << "Thread: " << std::this_thread::get_id() << " acquired locks on: " << from.id << " " << to.id << std::endl;
    from.transactions.emplace_back("-" + std::to_string(amount));
    to.transactions.emplace_back("+" + std::to_string(amount));
    from.amount -= amount;
    to.amount += amount;
    std::this_thread::sleep_for(std::chrono::seconds(1));
}

int main() {
    Account alice("alice"), bob("bob"), christina("christina"), dave("dave");
    std::vector<std::thread> threads;
    threads.emplace_back(transfer_money, std::ref(alice),     std::ref(bob),   100.0f);
    threads.emplace_back(transfer_money, std::ref(christina), std::ref(bob),   100.0f);
    threads.emplace_back(transfer_money, std::ref(christina), std::ref(alice), 100.0f);
    threads.emplace_back(transfer_money, std::ref(dave),      std::ref(bob),   100.0f);
    threads.emplace_back(transfer_money, std::ref(alice),     std::ref(bob),   100.0f);
    threads.emplace_back(transfer_money, std::ref(christina), std::ref(bob),   100.0f);
    threads.emplace_back(transfer_money, std::ref(christina), std::ref(alice), 100.0f);
    threads.emplace_back(transfer_money, std::ref(dave),      std::ref(bob),   100.0f);
    threads.emplace_back(transfer_money, std::ref(alice),     std::ref(bob),   100.0f);
    threads.emplace_back(transfer_money, std::ref(christina), std::ref(bob),   100.0f);
    threads.emplace_back(transfer_money, std::ref(christina), std::ref(alice), 100.0f);
    threads.emplace_back(transfer_money, std::ref(dave),      std::ref(bob),   100.0f);
    threads.emplace_back(transfer_money, std::ref(alice),     std::ref(bob),   100.0f);
    threads.emplace_back(transfer_money, std::ref(christina), std::ref(bob),   100.0f);
    threads.emplace_back(transfer_money, std::ref(christina), std::ref(alice), 100.0f);
    threads.emplace_back(transfer_money, std::ref(dave),      std::ref(bob),   100.0f);
    for (auto &thread : threads) thread.join();
    std::cout << alice.output() << '\n'  << bob.output() << '\n' << christina.output() << '\n' << dave.output() << '\n';
}