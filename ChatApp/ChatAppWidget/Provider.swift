//
//  Provider.swift
//  ChatApp
//
//  Created by Костина Вероника  on 30.06.2024.
//

import WidgetKit

struct Provider: AppIntentTimelineProvider {
    let mockChatService = MockChatService()
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), chats: [.placeholder()], avatarColor: AvatarWidgetColor.colors[0])
    }
    
    func snapshot(for configuration: AvatarColorsAppIntent, in context: Context) async -> SimpleEntry {
        do {
            let chats = try mockChatService.getAllChats()
            let fourChats = Array(chats.prefix(4))
            return SimpleEntry(date: Date(), chats: fourChats, avatarColor: configuration.avatarColor)
        }
        catch {
            return SimpleEntry(date: Date(), chats: [.placeholder()], avatarColor: configuration.avatarColor)
        }
    }
    
    func timeline(for configuration: AvatarColorsAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        do {
            let chats = try mockChatService.getAllChats()
            let fourChats = Array(chats.prefix(4))
            let entry = SimpleEntry(date: Date(), chats: fourChats, avatarColor: configuration.avatarColor)
            
            return Timeline(entries: [entry], policy: .after(.now.advanced(by: 60*30)))
        }
        catch {
            let entry = SimpleEntry(date: Date(), chats: [.placeholder()], avatarColor: configuration.avatarColor)
            return Timeline(entries: [entry], policy: .after(.now.advanced(by: 60*30)))
        }
    }
}
