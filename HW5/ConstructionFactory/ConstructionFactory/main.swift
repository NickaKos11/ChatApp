//
//  main.swift
//  ConstructionFactory
//
//  Created by Костина Вероника  on 27.06.2024.
//

import Foundation


func main() {
    let factory = Factory()
    
    let staff1: Person? = Person(name: "Вероника", surname: "Костина", age: 24)
    var passport1: Passport? = Passport(series: 8000, number: 800111, issueDate: Date(timeIntervalSinceNow: -10000000), owner: staff1!)
    staff1?.passport = passport1
    
    if let staff1 {
        factory.hirePerson(person: staff1)
    }
    
    var staff2: Person? = Person(name: "Петр", surname: "Ибрагимов", age: 13)
    if let staff2 {
        factory.hirePerson(person: staff2)
    }
    
    var staff3: Person? = Person(name: "Иван", surname: "Иванов", age: 32)
    var passport3: Passport? = nil
    if let staff3 {
        passport3 = Passport(series: 7255, number: 722555, issueDate: Date(timeIntervalSinceNow: -100000000), owner: staff3)
        staff3.passport = passport3
        factory.hirePerson(person: staff3)
    }
    
    factory.getAllStaff()
        
    factory.produceMaterials()
    factory.produceMaterials()
    
    factory.sellMaterials(number: 100)
    factory.sellMaterials(number: 1)
    
    factory.quitFromJob(person: staff1)
    passport1 = nil // из памяти деинициализируется только паспорт. Ссылка на человека остается, пока не закончится функция. Человек деинициализируется после завершения программы.
    
    factory.quitFromJob(person: staff2)
    staff2 = nil // человек сразу деинициализируется, т.к у него нет паспорта
    
    factory.quitFromJob(person: staff3)
    staff3 = nil // человек не деинциализируется сразу, т.к паспорт все еще держит на него ссылку. После выхода из функции деинициализируется паспорт, а затем человек.
    
    print("Завершение программы")
}

main()
