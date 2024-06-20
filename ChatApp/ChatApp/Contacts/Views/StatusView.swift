//
//  StatusView.swift
//  ChatApp
//
//  Created by Костина Вероника  on 20.06.2024.
//

import SwiftUI

struct StatusView: View {
    let status: Status
    var body: some View {
        if status == .online {
            Image(systemName: "circle.fill")
                .resizable()
                .foregroundColor(.greenAccent)
                .frame(width: 14, height: 14)
                .overlay(
                    Circle()
                        .stroke(.white, lineWidth: 2)
                )
                .offset(x: 20, y: -20)
        }
    }
}

#Preview {
    StatusView(status: .online)
}
