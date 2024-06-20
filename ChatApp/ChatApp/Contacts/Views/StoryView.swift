//
//  StoryView.swift
//  ChatApp
//
//  Created by Костина Вероника  on 20.06.2024.
//

import SwiftUI

struct StoryView: View {
    let hasStory: Bool
    let hasImage: Bool
    var body: some View {
        if hasStory {
            let lightColor: Color = hasImage ? .gradientImageLight : .gradientIconLight
            let darkColor: Color = hasImage ? .gradientImageDark : .gradientIconDark
            RoundedRectangle(cornerRadius: 16)
                .stroke(LinearGradient(gradient: Gradient(colors: [lightColor, darkColor]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2)
                .frame(width: 54, height: 54)
        }
    }
}

#Preview {
    StoryView(hasStory: true, hasImage: true)
}
