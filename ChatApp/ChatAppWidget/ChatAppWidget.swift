//
//  ChatAppWidget.swift
//  ChatAppWidget
//
//  Created by Костина Вероника  on 28.06.2024.
//

import WidgetKit
import SwiftUI

struct ChatAppWidget: Widget {
    let kind: String = "ChatAppWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind,
                               intent: AvatarColorsAppIntent.self,
                               provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                ChatAppWidgetEntryView(entry: entry)
                    .containerBackground(.widgetBackground, for: .widget)
            } else {
                ChatAppWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .supportedFamilies([.systemSmall, .systemMedium])
        .contentMarginsDisabled()
        .configurationDisplayName("Мои чаты")
        .description("Вы можете добавить ярлыки для быстрого доступа к важным чатам. ")
    }
}

#Preview(as: .systemSmall) {
    ChatAppWidget()
} timeline: {
    SimpleEntry(date: .now, chats: [ChatInfo(id: 0, name: "Veronika", surname: "Kostina", imageName: nil, unreadMessages: 1, lastMessageDate: Date(timeIntervalSinceNow: -10000), lastMessage: "Привет", status: .offline)], avatarColor: AvatarWidgetColor.colors[0])
}
