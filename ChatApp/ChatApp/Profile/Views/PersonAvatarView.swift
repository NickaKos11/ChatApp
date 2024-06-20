//
//  PersonAvatarView.swift
//  ChatApp
//
//  Created by Костина Вероника  on 21.06.2024.
//

import SwiftUI

struct PersonAvatarView: View {
    var body: some View {
        Image("Person")
            .renderingMode(.template)
            .foregroundStyle(.mainText)
            .frame(width: 112, height: 112)
            .background(Circle()
                .fill(.accentBackground)
                .frame(width: 200, height: 200))
            .padding(.bottom, 70)
    }
}

#Preview {
    PersonAvatarView()
}
