//
//  SearchView.swift
//  ChatApp
//
//  Created by Костина Вероника  on 19.06.2024.
//

import SwiftUI

struct SearchView: View {
    @State private var searchContact: String = ""
    var body: some View {
        HStack(alignment: .center) {
            Image("Search")
            .resizable()
            .frame(width: 24, height: 24)

          TextField("Поиск", text: $searchContact)
                .textFont(.body1)
                .foregroundStyle(.lightText)
        }
        .frame(height: 36)
        .padding(.leading, 8)
        .background(RoundedRectangle(cornerRadius: 4).fill(.accentBackground))
        .padding(.horizontal, 24)
    }
}

#Preview {
    SearchView()
}
