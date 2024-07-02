//
//  HeaderView.swift
//  ChatAppWidgetExtension
//
//  Created by Костина Вероника  on 29.06.2024.
//

import SwiftUI

struct HeaderView: View {
    var color: Color
    var body: some View {
        HStack {
            Image(systemName: "message")
                .foregroundStyle(.white)
                .font(.system(size: 18, weight: .semibold))
                .padding(.leading, 10)
            
            Text("Мои чаты:")
                .multilineTextAlignment(.leading)
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(.white)
                .frame(height: 50)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Rectangle().fill(color))
        .padding(.bottom, 5)
    }
}

#Preview {
    HeaderView(color: .accent)
}
