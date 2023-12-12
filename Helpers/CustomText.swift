//
//  CustomText.swift
//  TradeTest
//
//  Created by Rodomil on 16.11.2023.
//

import SwiftUI

struct CustomText: View {
    
    enum TextColor {
        case green
        case grey
        case white
    }
    
    enum TypeFont {
        case regular
        case medium
        case bold
    }
    
    var text: String
    var colorText: TextColor
    var typeFont: TypeFont
    var size: CGFloat
    
    var body: some View {
        Text(text)
            .foregroundColor(colText())
            .font(.custom(fontType(), size: size))
//            .fontWeight(typeFont)
    }
    
    private func colText() -> Color {
        switch colorText {
        case .green: return .greenText
        case .grey: return .grayText
        case .white: return .white
        }
    }
    
    private func fontType() -> String {
        switch typeFont {
        case .regular: return "Inter Regular"
        case .medium: return "Inter Medium"
        case .bold: return "Inter Bold"
        }
    }
  
}

