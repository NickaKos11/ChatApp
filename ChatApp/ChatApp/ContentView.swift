//
//  ContentView.swift
//  ChatApp
//
//  Created by Костина Вероника  on 09.06.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ContactsScreen()
                .tabItem {
                    Image("ContactsIcon")
                }
            
            ContactsScreen()
                .tabItem {
                    Image("ChatsIcon")
                }
            
            ContactsScreen()
                .tabItem {
                    Image("MenuIcon")
                }
            
        }.accentColor(.buttonActive)

    }
}

#Preview {
    ContentView()
}
