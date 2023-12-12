//
//  Indicatior.swift
//  TradeTest
//
//  Created by Rodomil on 16.11.2023.
//

import SwiftUI

struct Indicatior: View {
    var model: LoginModel
    @State private var count: CGFloat = 0
    @State private var ctountText = 0
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack(alignment: .center) {
            HStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: count, height: 24)
                    .background(Color(red: 0.21, green: 0.73, blue: 0.45))
                    .cornerRadius(30)
                    .padding(.leading, 0)
                    .onReceive(timer) { _ in
                        self.count += model.widthIndicator / 100
                        self.ctountText += 1
                        if self.ctountText == 100 {
                            self.timer.upstream.connect().cancel()
                            model.complite = true
                        }
                    }
                Spacer()
            }
            
            CustomText(text: "\(ctountText) %", colorText: .white, typeFont: .bold, size: 16)

        }
        .background(Color.loadFon)
        .cornerRadius(30)
    }
}

#Preview {
    Indicatior(model: LoginModel())
}
