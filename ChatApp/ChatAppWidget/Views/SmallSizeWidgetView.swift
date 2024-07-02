//
//  SmallSizeWidgetView.swift
//  ChatAppWidgetExtension
//
//  Created by Костина Вероника  on 28.06.2024.
//

import WidgetKit
import SwiftUI

struct SmallSizeWidgetView: View {
    var entry: SimpleEntry
    
    var body: some View {
        let chat = entry.chats[0]
        VStack {
            ZStack {
                AvatarView(image: chat.image, initials: chat.initials, color: entry.avatarColor.color)
                if chat.unreadMessages > 0 {
                    MessageView(unreadMessages: chat.unreadMessages)
                }
            }
        
            Text(chat.name)
                .textFont(.subheading2)
                .foregroundStyle(.mainText)
            Text(chat.surname != nil ? "\(chat.surname!)" : "")
                .textFont(.subheading2)
                .foregroundStyle(.mainText)
        }
        .widgetURL(URL(string: "chatapp://contacts/\(chat.id)"))
        //пока открываем первый контакт, но потом будем открывать первый, либо избранный чат
    }
}


