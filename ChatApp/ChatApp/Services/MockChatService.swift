//
//  MockChatService.swift
//  ChatApp
//
//  Created by Костина Вероника  on 29.06.2024.
//

import Foundation

final class MockChatService {
    func getAllChats() throws -> [ChatInfo] {
        let mockData = [
            ChatInfo(id: 0, name: "Анастасия", surname: "Иванова", imageName: "Avatar", unreadMessages: 2,         lastMessageDate: Date(timeIntervalSinceNow: -10000), lastMessage: "Привет", status: .online),
            ChatInfo(id: 1, name: "Петя", surname: "Ибрагимов", imageName: nil, unreadMessages: 1, lastMessageDate: Date(timeIntervalSinceNow: -10000), lastMessage: "Как дела?", status: .online),
            ChatInfo(id: 2, name: "Мама", surname: nil, imageName: nil, unreadMessages: 12, lastMessageDate: Date(timeIntervalSinceNow: -10000), lastMessage: "Ок", status: .offline),
            ChatInfo(id: 3, name: "Папа", surname: nil, imageName: nil, unreadMessages: 0, lastMessageDate: Date(timeIntervalSinceNow: -10000), lastMessage: "Спасибо", status: .offline)
        ]
        return mockData
    }
}
