//
//  MessageView.swift
//  ChatAppWidgetExtension
//
//  Created by Костина Вероника  on 29.06.2024.
//

import SwiftUI

struct MessageView: View {
    var unreadMessages: Int
    
    var body: some View {
        Text(String(unreadMessages))
            .foregroundStyle(.accent)
            .textFont(.body1)
            .frame(width: 20, height: 20)
            .background(Circle().fill(.message).stroke(.accent))
            .offset(x: 20, y: -20)
    }
}

#Preview {
    MessageView(unreadMessages: 5)
}
