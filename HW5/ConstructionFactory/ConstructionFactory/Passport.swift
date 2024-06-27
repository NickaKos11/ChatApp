//
//  Passport.swift
//  ConstructionFactory
//
//  Created by Костина Вероника  on 27.06.2024.
//

import Foundation

class Passport {
    let series: Int
    let number: Int
    let issueDate: Date
    let owner: Person
    
    init(series: Int, number: Int, issueDate: Date, owner: Person) {
        self.series = series
        self.number = number
        self.issueDate = issueDate
        self.owner = owner
        print("The \(owner.name+" "+owner.surname) passport has been initialized")
    }
    
    deinit {
        print("The \(owner.name+" "+owner.surname) passport has been deinitialized")
    }
}
