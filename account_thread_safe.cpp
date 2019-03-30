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
    // Protects object instance
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
    // Acquire two locks without worrying about deadlocks
    std::lock(from.m, to.m);
    /* Use mutex wrapper lock_guard to unlock mutex at the end of scope
       std::adopt_lock is used because lock was already obtained by std::lock
       3 types of lock_guards:
            defer_lock_t	do not acquire ownership of the mutex
            try_to_lock_t	try to acquire ownership of the mutex without blocking
            adopt_lock_t	assume the calling thread already has ownership of the mutex
     */
    std::lock_guard<std::mutex> lk1(from.m, std::adopt_lock);
    std::lock_guard<std::mutex> lk2(to.m, std::adopt_lock);

    std::cout << "Thread: " << std::this_thread::get_id() << " acquired locks on: " << from.id << " " << to.id << std::endl;
    from.transactions.emplace_back("-" + std::to_string(amount));
    to.transactions.emplace_back("+" + std::to_string(amount));
    from.amount -= amount;
    to.amount += amount;

    // Simulate long operation
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