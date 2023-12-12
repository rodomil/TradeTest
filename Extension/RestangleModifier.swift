//
//  RestangleModifier.swift
//  TradeTest
//
//  Created by Rodomil on 16.11.2023.
//

import SwiftUI
import Combine

struct RestangleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.clear)
            .frame(height: 54)
            .background(Color(red: 0.2, green: 0.22, blue: 0.29))
            .cornerRadius(12)
    }
}

extension View {
    func customRectangle() -> some View {
        modifier(RestangleModifier())
    }
}

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .font(.custom("Inter Bold", size: 16))
            .keyboardType(.numberPad)
            
    }
}

extension View {
    func customTextField() -> some View {
        modifier(TextFieldModifier())
    }
}

extension Publishers {
    static var keyboardHeight: AnyPublisher<CGFloat, Never> {
        let willShow = NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification)
            .map { $0.keyboardHeight }
        
        let willHide = NotificationCenter.default.publisher(for: UIApplication.keyboardWillHideNotification)
            .map { _ in CGFloat(0) }
        return MergeMany(willShow, willHide)
            .eraseToAnyPublisher()
    }
}

extension Notification {
    var keyboardHeight: CGFloat {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
}

struct KeyboardAdaptive: ViewModifier {
    @State var keyboardHeight: CGFloat = 0

    func body(content: Content) -> some View {
        content
            .padding(.bottom, keyboardHeight / 2)
            .onReceive(Publishers.keyboardHeight) { self.keyboardHeight = $0 }
    }
}

extension View {
    func keyboardAdaptive() -> some View {
        ModifiedContent(content: self, modifier: KeyboardAdaptive())
    }
}
