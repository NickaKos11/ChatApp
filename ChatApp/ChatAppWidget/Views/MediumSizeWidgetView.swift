//
//  MediumSizeWidgetView.swift
//  ChatAppWidgetExtension
//
//  Created by Костина Вероника  on 28.06.2024.
//

import WidgetKit
import SwiftUI

struct MediumSizeWidgetView: View {
    var entry: SimpleEntry
    
    var body: some View {
        VStack{
            HeaderView(color: entry.avatarColor.color)
            Spacer()
            HStack {
                ForEach(entry.chats) { chat in
                    //Потом будем открывать чаты, пока детальную информацию каждого контакта
                    Link(destination: URL(string: "chatapp://contacts/\(chat.id)")!) {
                        ZStack {
                            AvatarView(image: chat.image, initials: chat.initials, color: entry.avatarColor.color)
                            if chat.unreadMessages > 0 {
                                MessageView(unreadMessages: chat.unreadMessages)
                            }
                        }
                    }
                }
            }.padding(.bottom, 30)
        }
    }
}
