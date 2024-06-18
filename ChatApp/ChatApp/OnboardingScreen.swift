//
//  OnboardingScreen.swift
//  ChatApp
//
//  Created by Костина Вероника  on 09.06.2024.
//

import SwiftUI

struct OnboardingScreen: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var showModal: Bool = false
    
    var body: some View {
        ZStack {
            Color.customBackground.ignoresSafeArea()
            VStack(spacing: 0) {
                Spacer()
                Image(colorScheme == .dark ? "OnboardingDark" : "OnboardingLight")
                
                Text("Общайтесь с друзьями\nи близкими легко")
                    .textFont(.heading2)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.mainText)
                    .padding(.top, 42)
                
                Spacer()
                
                Text("Нажимая кнопку продолжить, я соглашаюсь с")
                    .textFont(.metadata2)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.additionalText)
                
                TermsOfUseView().textFont(.metadata2)
                
                Button("Начать общаться") {
                    showModal = true
                }
                .buttonStyle(MainButtonStyle())
                .padding(EdgeInsets(top: 18, leading: 24, bottom: 20, trailing: 24))
                .sheet(isPresented: $showModal, content: {
                    AuthScreen()
                })
                
            }
        }
    }
}

struct TermsOfUseView: View {
    var attributedString: AttributedString

    init() {
        var textPart1: AttributedString {
            var result = AttributedString("Политикой Конфиденциальности")
            result.foregroundColor = .buttonActive
            result.link = URL(string: "https://ya.ru/")
            return result
        }
        
        var textPart2: AttributedString {
            var result = AttributedString(" и ")
            result.foregroundColor = .additionalText
            return result
        }
        
        var textPart3: AttributedString {
            var result = AttributedString("Условиями Пользования")
            result.foregroundColor = .buttonActive
            result.link = URL(string: "https://ya.ru/")
            return result
        }
        
       attributedString = textPart1+textPart2+textPart3
    }

    var body: some View {
        Text(attributedString)
            .padding(.top, 2)
    }
}

#Preview {
    OnboardingScreen()
}
