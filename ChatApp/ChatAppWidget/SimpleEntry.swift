//
//  SimpleEntry.swift
//  ChatApp
//
//  Created by Костина Вероника  on 30.06.2024.
//

import WidgetKit
import SwiftUI

struct SimpleEntry: TimelineEntry {
    let date: Date
    let chats: [ChatInfo]
    let avatarColor: AvatarWidgetColor
}
