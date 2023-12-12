//
//  InputView.swift
//  TradeTest
//
//  Created by Rodomil on 16.11.2023.
//

import SwiftUI



struct InputView: View {
    
    enum TypeImputView {
        case timer
        case money
    }
    
    var typeView: TypeImputView
    @State var money = "500"
    @State var tx = "00:15"
    @State var edit = false
    
    var body: some View {
        ZStack {
            if edit {
                Rectangle()
                    .customRectangle()
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.greenText, lineWidth: 3)
                    )
            } else {
                Rectangle()
                    .customRectangle()
            }
            HStack(alignment: .bottom) {
                Button(action: {
                    switch typeView {
                    case .timer: break
                    case .money:
                        money = "\((Int(money) ?? 0) - 500)"
                        if (Int(money) ?? 0) < 500 { money = "500" }
                    }
                }, label: {
                    CustomImage(image: "minus-circle", size: 18)
                })
                .padding([.leading], 15)
                .padding([.bottom], 4)
                Spacer()
                VStack {
                    CustomText(text: title(), colorText: .white, typeFont: .medium, size: 12)
                    if typeView == .timer {
                        TextField("", text: $tx, onEditingChanged: { (isBegin) in
                            if isBegin { edit = true } else { edit = false }
                        })
                        .customTextField()

                    } else {
                        TextField("", text: $money, onEditingChanged: { (isBegin) in
                            if isBegin { edit = true } else { edit = false }
                        })
                        .customTextField()
                    }
                }
                Spacer()
                Button(action: {
                    switch typeView {
                    case .timer: break
                    case .money: money = "\((Int(money) ?? 0) + 500)"
                    }
                }, label: {
                    CustomImage(image: "add-circle", size: 18)
                })
                .padding([.trailing], 15)
                .padding([.bottom], 4)
                
            }
        }
    }
    
    private func title() -> String {
        switch typeView {
        case .timer: return "Timer"
        case .money: return "Investment"
        }
    }
}

#Preview {
    InputView(typeView: .timer)
}
