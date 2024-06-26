//
//  Transaction.swift
//  BankProgram
//
//  Created by Костина Вероника  on 26.06.2024.
//

import Foundation

struct Transaction {
    let date: Date
    let type: TransactionType
}

enum TransactionType {
    case addition
    case replenishment(Double)
    case withdrawal(Double)
    case deletion
}
