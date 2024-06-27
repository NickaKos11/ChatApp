//
//  Person.swift
//  ConstructionFactory
//
//  Created by Костина Вероника  on 27.06.2024.
//

import Foundation

class Person {
    let name: String
    let surname: String
    let age: Int
   // var passport: Passport? // при замене на эту строку, возникает retain cycle. Люди, у которых есть паспорт, не будут деинициализированы
    weak var passport: Passport?
    
    init(name: String, surname: String, age: Int, passport: Passport? = nil) {
        self.name = name
        self.surname = surname
        self.age = age
        self.passport = passport
        print("The person \(name+" "+surname) has been initialized")
    }
    
    deinit {
        print("The person \(name+" "+surname) has been deinitialized")
    }
}
