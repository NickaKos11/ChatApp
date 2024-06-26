//
//  Client.swift
//  BankProgram
//
//  Created by Костина Вероника  on 26.06.2024.
//

import Foundation
class Client {
    let personName: String
    var accounts: [Double] = [0]
    var history: [Transaction] = []
    
    init(personName: String) {
        self.personName = personName
    }
    
    func addTransaction(date: Date = .now, type: TransactionType) {
        history.append(Transaction(date: date, type: type))
    }
}
