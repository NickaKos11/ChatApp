//
//  Fonts.swift
//  ChatApp
//
//  Created by Костина Вероника  on 09.06.2024.
//

import Foundation
import SwiftUI

enum CustomFont {
    case heading2
    case body2
    case subheading2
    case metadata2
}

struct TextFontModifier: ViewModifier {
    let font: CustomFont

    func body(content: Content) -> some View {
        content.font(getCustomFont(font))
    }
    
    func getCustomFont(_ font: CustomFont) -> Font {
        switch font {
        case .heading2: .system(size: 24, weight: .bold)
        case .body2: .system(size: 14, weight: .semibold)
        case .subheading2: .system(size: 16, weight: .semibold)
        case .metadata2: .system(size: 10, weight: .regular)
        }
    }
}

extension View {
    func textFont(_ customFont: CustomFont) -> some View {
        modifier(TextFontModifier(font: customFont))
    }
}
