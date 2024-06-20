//
//  ProfileScreen.swift
//  ChatApp
//
//  Created by Костина Вероника  on 20.06.2024.
//

import SwiftUI

struct ProfileScreen: View {
    let person: Person
    
    var body: some View {
        ZStack {
            Color.customBackground.ignoresSafeArea()
            VStack(spacing: 0) {
                Image("Person")
                    .renderingMode(.template)
                    .foregroundStyle(.mainText)
                    .frame(width: 112, height: 112)
                    .background(Circle()
                        .fill(.accentBackground)
                        .frame(width: 200, height: 200))
                    .padding(.bottom, 70)
                
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
    }
}



#Preview {
    ProfileScreen(person: Person(name: "Петя", surname: "Ибрагимов", phone: "+7-989-111-37-12", imageName: nil, status: .online, lastSeen: "now", hasStory: false))
}
