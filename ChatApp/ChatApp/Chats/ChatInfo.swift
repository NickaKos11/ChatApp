//
//  ChatInfo.swift
//  ChatApp
//
//  Created by Костина Вероника  on 28.06.2024.
//

import Foundation
import SwiftUI

struct ChatInfo: Identifiable {
    let id: Int
    let name: String
    let surname: String?
    let imageName: String?
    let unreadMessages: Int
    let lastMessageDate: Date
    let lastMessage: String
    let status: Status
    
    var initials: String {
        if let surname {
            return String(name[name.startIndex]) + String(surname[surname.startIndex])
        }
        return String(name[name.startIndex])
    }
    
    var image: Image? {
        guard let imageName else {
            return nil
        }
        return Image(imageName)
    }
    
    static func placeholder() -> ChatInfo {
        ChatInfo(id: 0, name: "Имя", surname: "Фамилия", imageName: nil, unreadMessages: 1, lastMessageDate: .now, lastMessage: "Привет!", status: .online)
    }
}
