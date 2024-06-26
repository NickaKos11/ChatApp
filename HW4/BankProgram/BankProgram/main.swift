//
//  main.swift
//  BankProgram
//
//  Created by Костина Вероника  on 26.06.2024.
//

import Foundation

func inputName() -> String {
    var name = ""
    print("Введите имя и фамилию:")
    repeat {
        name = readLine() ?? ""
    } while name.isEmpty
    return name
}

func main() {
    let bank = Bank()
    var name = inputName()
    
    print(
        """
        Доступные опции:
        Создать новый счет - 1
        Узнать баланс - 2
        Пополнить счет - 3
        Снять средства - 4
        Перевести средства между своими счетами - 5
        Перевести средства другому человеку - 6
        Узнать историю операций по счету - 7
        Удалить счет - 8
        Сменить пользователя - 9
        Выйти из программы - 0
        """)
    
    var choice: Int?
    while choice != 0 {
        print("\nВведите опцию.")
        if let input = Int(readLine() ?? "") {
            choice = input
            switch choice {
            case 0: print("Завершение программы.")
            case 1: bank.createAccount(name: name)
            case 2: bank.getAmount(name: name)
            case 3: bank.addMoney(name: name)
            case 4: bank.withdrawMoney(name: name)
            case 5: bank.transferClientMoney(name: name)
            case 6: bank.transferMoney(from: name)
            case 7: bank.getHistory(name: name)
            case 8: bank.deleteAccount(name: name)
            case 9: name = inputName()
            default: print("Данная опция недоступна.")
            }
        } else {
            print("Неправильные данные. Повторите попытку.")
        }
    }
}

main()
