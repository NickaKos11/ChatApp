//
//  MainButtonStyle.swift
//  ChatApp
//
//  Created by Костина Вероника  on 09.06.2024.
//

import SwiftUI

struct MainButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled
    
    func makeBody(configuration: Self.Configuration) -> some View {
        let backgroundColor: Color = isEnabled ? .buttonActive : .buttonDisabled
        let foregroundColor: Color = isEnabled ? .buttonText : .buttonDisabledText
        
       return configuration.label
            .textFont(.subheading2)
            .frame(height: 52)
            .frame(maxWidth: .infinity)
            .foregroundStyle(foregroundColor)
            .background(RoundedRectangle(cornerRadius: 30).fill(backgroundColor))
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}
