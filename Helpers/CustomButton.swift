//
//  CustomButton.swift
//  TradeTest
//
//  Created by Rodomil on 16.11.2023.
//

import SwiftUI

struct CustomButton: View {
    
    enum TypeButton {
        case red
        case green
    }
    var typeButtom: TypeButton
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(height: 54)
                .background(color())
                .cornerRadius(12)
            HStack {
                CustomText(text: text(), colorText: .white, typeFont: .medium, size: 24)
                    .padding(.leading, 20)
                Spacer()
            }
        }
    }
    
    private func color() -> Color {
        switch typeButtom {
        case .red: return Color.customRed
        case .green: return Color.greenText
        }
    }
    
    private func text() -> String {
        switch typeButtom {
        case .red: return "Sell"
        case .green: return "Buy"
        }
    }
}

#Preview {
    CustomButton(typeButtom: .red)
}
