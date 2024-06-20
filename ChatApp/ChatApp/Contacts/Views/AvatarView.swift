//
//  AvatarView.swift
//  ChatApp
//
//  Created by Костина Вероника  on 20.06.2024.
//

import SwiftUI

struct AvatarView: View {
    var image: Image?
    var initials: String
    var body: some View {
        if let image {
            image
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .background(.customBackground)
                .padding(2)
            
        } else {
            Text(initials)
                .textFont(.bodyBold)
                .foregroundStyle(.customBackground)
                .frame(width: 48, height: 48)
                .background(RoundedRectangle(cornerRadius: 16).fill(.buttonActive))
                .padding(2)
            
        }
    }
}

#Preview {
    AvatarView(image: nil, initials: "ВК")
}
