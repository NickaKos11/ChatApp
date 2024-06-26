//
//  Bank.swift
//  BankProgram
//
//  Created by Костина Вероника  on 26.06.2024.
//

import Foundation

class Bank {
    var clients: [String: Client] = [:]
    
    func createAccount(name: String) {
        if let client = clients[name] {
            client.accounts.append(0)
        } else {
            clients[name] = Client(personName: name)
        }
        let client = clients[name]!
        client.addTransaction(type: .addition)
        
        printAccounts(of: client)
    }
    
    func getAmount(name: String) {
        if let client = findClient(name: name) {
            print("\n\(name), Ваши текущие счета:")
            for (index, element) in client.accounts.enumerated() {
                print("\(index+1) - \(element) руб.")
            }
        }
    }
    
    func addMoney(name: String) {
        if let client = findClient(name: name) {
            print("\nВведите номер счета для пополнения:")
            guard let number = chooseAccount(client: client) else { return }
            
            print("Введите сумму")
            guard let amount = Double(readLine()!), amount > 0 else {
                print("Неправильная сумма, повторите операцию.")
                return
            }
            
            client.accounts[number-1] += amount
            client.addTransaction(type: .replenishment(amount))
            
            printAccounts(of: client)
        }
    }
    
    func withdrawMoney(name: String) {
        if let client = findClient(name: name) {
            print("\nВведите номер счета для снятия:")
            guard let number = chooseAccount(client: client) else { return }
            
            print("Введите сумму")
            guard let amount = Double(readLine()!), amount > 0 else {
                print("Неправильная сумма, повторите операцию.")
                return
            }
            
            if amount > client.accounts[number-1] {
                print("Недостаточно средств на счете.")
                return
            } else {
                client.accounts[number-1] -= amount
                client.addTransaction(type: .withdrawal(amount))
            }
            
            printAccounts(of: client)
        }
    }
    
    func transferClientMoney(name: String) {
        if let client = findClient(name: name) {
            for (index, element) in client.accounts.enumerated() {
                print("\(index+1) - \(element) руб.")
            }
            
            print("\nВведите номер счета для снятия:")
            guard let numberFrom = chooseAccount(client: client) else { return }
            
            print("\nВведите номер счета для пополнения:")
            guard let numberTo = chooseAccount(client: client) else { return }
            
            print("Введите сумму")
            guard let amount = Double(readLine()!), amount > 0 else {
                print("Неправильная сумма, повторите операцию.")
                return
            }
            
            if amount > client.accounts[numberFrom-1] {
                print("Недостаточно средств на счете.")
                return
            } else {
                client.accounts[numberFrom-1] -= amount
                client.addTransaction(type: .withdrawal(amount))
                client.accounts[numberTo-1] += amount
                client.addTransaction(type: .replenishment(amount))
            }
            
            printAccounts(of: client)
        }
    }
    
    func deleteAccount(name: String) {
        if let client = findClient(name: name) {
            print("\nВыберите счет для удаления:")
            guard let number = chooseAccount(client: client) else { return }
            
            if client.accounts[number-1]>0 {
                print("На счете есть средства. Сначала переведите их на другой счет")
            } else {
                client.accounts.remove(at: number-1)
                client.addTransaction(type: .deletion)
                printAccounts(of: client)
            }
        }
    }
    
    func transferMoney(from senderName: String) {
        if let client = findClient(name: senderName) {
            print("Введите имя и фамилию получателя")
            if let recipientName = readLine(), !recipientName.isEmpty {
                guard let recipient = clients[recipientName] else {
                    print("\nУ этого пользователя нет открытых счетов в нашем банке.")
                    return
                }
                
                print("\nВыберите счет для перевода:")
                guard let number = chooseAccount(client: client) else { return }
                
                print("Введите сумму")
                guard let amount = Double(readLine()!), amount > 0 else {
                    print("Неправильная сумма, повторите операцию.")
                    return
                }
                
                if amount > client.accounts[number-1] {
                    print("Недостаточно средств на счете.")
                    return
                } else {
                    client.accounts[number-1] -= amount
                    client.addTransaction(type: .withdrawal(amount))
                    recipient.accounts[0] += amount
                    recipient.addTransaction(type: .replenishment(amount))
                    printAccounts(of: client)
                }
            }
        }
    }
    
    func getHistory(name: String) {
        if let client = findClient(name: name) {
            for el in client.history {
                let type =  switch el.type {
                case .addition: "Создание нового счета"
                case .deletion: "Удаление счета"
                case .replenishment(let amount): "Добавление \(amount) руб"
                case .withdrawal(let amount): "Снятие \(amount) руб"
                }
                print("Дата: \(el.date), операция: \(type)")
            }
        }
    }
    
    private func chooseAccount(client: Client) -> Int? {
        for (index, element) in client.accounts.enumerated() {
            print("\(index+1) - \(element) руб.")
        }
        guard let number = Int(readLine()!),
              number>0,
              number<client.accounts.count+1
        else {
            print("Выбран неправильный счет, повторите операцию")
            return nil
        }
        return number
    }
    
    private func findClient(name: String) -> Client? {
        guard let client = clients[name] else {
            print("\nУ вас пока нет открытых счетов. Вы можете создать новый счет.")
            return nil
        }
        return client
    }
    
    private func printAccounts(of client: Client) {
        print("Операция выполнена успешно. Ваши текущие счета:")
        for (index, element) in client.accounts.enumerated() {
            print("\(index+1) - \(element) руб.")
        }
    }
}
