//
//  DismissButtonView.swift
//  ChatApp
//
//  Created by Костина Вероника  on 21.06.2024.
//

import SwiftUI

struct DismissButtonView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "chevron.left")
                .resizable()
                .foregroundStyle(.mainText)
                .fontWeight(.semibold)
                .frame(width: 8, height: 12)
        }
    }
}

#Preview {
    DismissButtonView()
}
