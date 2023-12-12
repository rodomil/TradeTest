//
//  TopCellView.swift
//  TradeTest
//
//  Created by Rodomil on 16.11.2023.
//

import SwiftUI

struct TopCellView: View {
    var item: TopStruct
    var body: some View {
        if item.nomer == 0 {
            HStack {
                CustomText(text: "№", colorText: .grey, typeFont: .medium, size: 12)
                    .frame(width: 70)
                    .multilineTextAlignment(.trailing)
                CustomText(text: "Сountry", colorText: .grey, typeFont: .medium, size: 12)
                    .frame(width: 50)
                CustomText(text: "Name", colorText: .grey, typeFont: .medium, size: 12)
                    .multilineTextAlignment(.leading)
                    .frame(width: UIScreen.main.bounds.width / 5)
                CustomText(text: "Deposit", colorText: .grey, typeFont: .medium, size: 12)
                    .multilineTextAlignment(.trailing)
                    .frame(width: UIScreen.main.bounds.width / 5)
                CustomText(text: "Profit", colorText: .grey, typeFont: .medium, size: 12)
                    .multilineTextAlignment(.trailing)
                    .frame(width: UIScreen.main.bounds.width / 5)
            }
            .frame(width: 350)
        } else {
            HStack(spacing: 10) {
                CustomText(text: "\(item.nomer)", colorText: .grey, typeFont: .medium, size: 14)
                    .multilineTextAlignment(.trailing)
                    .frame(width: 50)
                CustomImage(image: item.flag, size: 22)
                    .frame(width: 30)
                CustomText(text: item.name, colorText: .white, typeFont: .medium, size: 14)
                    .multilineTextAlignment(.leading)
                    .frame(width: UIScreen.main.bounds.width / 4.7)
                CustomText(text: "$\(item.deposit)", colorText: .white, typeFont: .medium, size: 14)
                    .multilineTextAlignment(.trailing)
                    .frame(width: UIScreen.main.bounds.width / 4.7)
                CustomText(text: "$\(item.profit)", colorText: .green, typeFont: .medium, size: 14)
                    .multilineTextAlignment(.trailing)
                    .frame(width: UIScreen.main.bounds.width / 4.7)
            }
        }
    }
}

#Preview {
    TopCellView(item: TopStruct(nomer: 1,
                                flag: "ac",
                                name: "Alex",
                                deposit: Int.random(in: 100..<10000),
                                profit: Int.random(in: 100..<10000)))
}
