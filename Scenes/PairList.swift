//
//  PairList.swift
//  TradeTest
//
//  Created by Rodomil on 16.11.2023.
//

import SwiftUI

struct PairList: View {
    var model: TradeModel
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack(alignment: .center) {
            GeometryReader { _ in}
                .background(Color.baground)
            
            VStack {
                CustomText(text: model.CurrencyPairTitle, colorText: .white, typeFont: .bold, size: 22)
                    .padding(.top, 64)
                ScrollView(.vertical) {
                    LazyVGrid(columns:[GridItem(), GridItem()], spacing: 21, content: {
                        ForEach(model.CurrencyPair) { item in
                            Button {
                                model.selectPair(pair: item.name)
                                presentationMode.wrappedValue.dismiss()
                            } label: {
                                Cell(item: item.name)
                            }
                        }
                    })
                }
                .padding([.leading, .trailing], 38)
                
                Spacer()
                GeometryReader { _ in }
                    .frame(height: 96)
                    .background(Color.backgroundTabBar)
            }
        }
        .ignoresSafeArea()
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    CustomImage(image: "arrow-left2", size: 24)
                })
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    PairList(model: TradeModel())
}

struct Cell: View {
    var item: String
    var body: some View {
        ZStack {
            Rectangle()
                .customRectangle()
            CustomText(text: item, colorText: .white, typeFont: .bold, size: 14)
        }
    }
}
