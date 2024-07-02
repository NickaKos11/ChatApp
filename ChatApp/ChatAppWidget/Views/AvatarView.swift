//
//  AvatarView.swift
//  ChatAppWidgetExtension
//
//  Created by Костина Вероника  on 28.06.2024.
//

import SwiftUI

struct AvatarView: View {
    var image: Image?
    var initials: String
    var color: Color
    
    var body: some View {
        if let image {
            image
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .background(.customBackground)
                .padding(.horizontal, 5)
        } else {
            Text(initials)
                .textFont(.subheading2)
                .foregroundStyle(.white)
                .frame(width: 60, height: 60)
                .background(Circle().fill(color))
                .padding(.horizontal, 5)
        }
    }
}

#Preview {
    AvatarView(initials: "ВА", color: .accent)
}
