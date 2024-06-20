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
                PersonAvatarView()
                PersonInfoView(person: person)
            }
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        DismissButtonView()
                        
                        Text("Профиль")
                            .foregroundColor(.mainText)
                            .textFont(.subheading1)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        // edit profile info
                    }, label: {
                        Image("pencil")
                            .renderingMode(.template)
                            .foregroundColor(.mainText)
                            .frame(width: 24, height: 24)
                            .fontWeight(.semibold)
                            .padding(.trailing, 8)
                    })
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}



#Preview {
    ProfileScreen(person: Person(name: "Петя", surname: "Ибрагимов", phone: "+7-989-111-37-12", imageName: nil, status: .online, lastSeen: "now", hasStory: false))
}
