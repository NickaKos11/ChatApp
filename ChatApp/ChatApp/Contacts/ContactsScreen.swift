//
//  ContactsScreen.swift
//  ChatApp
//
//  Created by Костина Вероника  on 18.06.2024.
//

import SwiftUI

struct ContactsScreen: View {
    // data
    let contacts: [Person] =
    [Person(name: "Анастасия", surname: "Иванова", phone: "+7 989 111-37-11", imageName: "Avatar", status: .online, lastSeen: "yesterday", hasStory: true),
     Person(name: "Петя", surname: "Ибрагимов", phone: "+7 989 111-37-12", imageName: nil, status: .online, lastSeen: "now", hasStory: false),
     Person(name: "Мама", surname: nil, phone: "+7 989 111-37-13", imageName: nil, status: .offline, lastSeen: "3 hours ago", hasStory: true),
     Person(name: "Папа", surname: nil, phone: "+7 989 111-37-14", imageName: nil, status: .offline, lastSeen: "3 hours ago", hasStory: true)
    ]
    
    @State private var path = [Person]()
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.customBackground.ignoresSafeArea()
                
                VStack(spacing: 0) {
                    SearchView().padding(.top, 24)
                    
                    List(contacts, id: \.self) { person in
                        Button(action: {
                            self.path.append(person)
                        }) {
                            ContactCell(person: person)
                        }
                        .listRowInsets(.init(top: 20, leading: 24, bottom: 16, trailing: 0))
                        .listRowBackground(Color.customBackground)
                    }
                    .listStyle(.plain)
                    .foregroundStyle(.customBackground)
                    .padding(.trailing, 24)
                    .navigationDestination(for: Person.self) { person in
                        ProfileScreen(person: person)
                    }
                    
                }.toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Text("Контакты")
                            .foregroundColor(.mainText)
                            .textFont(.subheading1)
                            .padding(.horizontal, 8)
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            // add contact
                        }, label: {
                            Image(systemName: "plus")
                                .foregroundColor(.mainText)
                                .frame(width: 24, height: 24)
                                .fontWeight(.semibold)
                                .padding(.trailing, 8)
                        })
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
            }
        } .onOpenURL{ url in
            guard url.scheme == "chatapp",
                  url.host == "contacts",
                  let id = Int(url.pathComponents[1]) else {
                print("url open error")
                return
            }
            self.path.append(contacts[id])
            print(path)
        }
    }
}

#Preview {
    ContactsScreen()
}
