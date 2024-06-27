//
//  Factory.swift
//  ConstructionFactory
//
//  Created by Костина Вероника  on 27.06.2024.
//

import Foundation

class Factory {
    var staff: [Int:Person] = [:]
    var materialsCount = 0
    
    func hirePerson(person: Person) {
        if let passport = person.passport {
            staff[passport.number+passport.series] = person
            print("Сотрудник \(person.name+" "+person.surname) нанят\n")
        } else {
            print("Мы не можем принять на работу без паспорта!\n")
        }
    }
    
    func getAllStaff() {
        print("Сотрудники компании:")
        for (_, value) in staff {
            print("Имя: \(value.name), Фамилия: \(value.surname), номер паспорта: \(String(describing: value.passport?.number))")
        }
    }
    
    func quitFromJob(person: Person?) {
        if let person = person,
           let passport = person.passport {
            staff[passport.number+passport.series] = nil
            print("Сотрудник \(person.name+" "+person.surname) уволен\n")
        } else {
           print("Такой сотрудник не работает в нашей компании")
        }
        
        if staff.isEmpty {
            print("На предприятии не осталось сотрудников!")
        }
    }
    
    func produceMaterials() {
        var producedToday = 0
        for _ in staff {
            let produceNow = Int.random(in: 1...10)
            producedToday+=produceNow
            materialsCount+=produceNow
        }
        print("Сегодня произведено: \(producedToday). Всего доступных материалов: \(materialsCount)\n")
    }
    
    func sellMaterials(number: Int) {
        if materialsCount>number {
            materialsCount-=number
            print("Продано \(number) материалов, осталось \(materialsCount) материалов\n")
        } else {
            print("Доступно только \(materialsCount) материалов\n")
        }
    }
    
}
