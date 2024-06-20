//
//  PersonInfoView.swift
//  ChatApp
//
//  Created by Костина Вероника  on 21.06.2024.
//

import SwiftUI

struct PersonInfoView: View {
    let person: Person
    var body: some View {
        Text(person.name+(person.surname != nil ? " \(person.surname!)" : ""))
            .textFont(.heading1)
            .foregroundStyle(.mainText)
            .padding(.bottom, 4)
        
        Text(person.phone)
            .textFont(.metadata3)
            .foregroundStyle(.lightText)
            .padding(.bottom, 40)
    }
}

#Preview {
    PersonInfoView(person: Person(name: "Петя", surname: "Ибрагимов", phone: "+7-989-111-37-12", imageName: nil, status: .online, lastSeen: "now", hasStory: false))
}
