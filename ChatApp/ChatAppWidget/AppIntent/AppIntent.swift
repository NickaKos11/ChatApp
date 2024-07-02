//
//  AppIntent.swift
//  ChatAppWidgetExtension
//
//  Created by Костина Вероника  on 02.07.2024.
//

import AppIntents
import SwiftUI
import WidgetKit

struct AvatarWidgetColor: AppEntity {
    var id: String
    var color: Color
    
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Avatars color"
    static var defaultQuery = AvatarWidgetColorQuery()
    
    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(title: "\(id)")
    }
    
    static let colors = [
        AvatarWidgetColor(id: "Default", color: .accent),
        AvatarWidgetColor(id: "Blue", color: .blue),
        AvatarWidgetColor(id: "Yellow", color: .yellow),
        AvatarWidgetColor(id: "Mint", color: .mint)
    ]
}

struct AvatarWidgetColorQuery: EntityQuery {
    func entities(for identifiers: [AvatarWidgetColor.ID]) async throws -> [AvatarWidgetColor] {
        AvatarWidgetColor.colors.filter {
            identifiers.contains($0.id)
        }
    }
    
    func suggestedEntities() async throws -> [AvatarWidgetColor] {
        AvatarWidgetColor.colors
    }
    
    func defaultResult() async -> AvatarWidgetColor? {
        AvatarWidgetColor.colors.first
    }
}

struct AvatarColorsAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Avatars color"
    static var description = IntentDescription("Select avatars color")

    @Parameter(title: "Avatars color")
    var avatarColor: AvatarWidgetColor
}
