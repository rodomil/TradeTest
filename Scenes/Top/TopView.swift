//
//  TopView.swift
//  TradeTest
//
//  Created by Rodomil on 16.11.2023.
//

import SwiftUI

struct TopView: View {
    @ObservedObject var model: TopModel
    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack(alignment: .center) {
            GeometryReader { _ in}
            .background(Color.baground)
            
            VStack {
                CustomText(text: model.headerText, colorText: .white, typeFont: .bold, size: 22)
                    .padding(.top, 64)
                List(model.list) { item in
                    TopCellView(item: item)
                        .listRowBackground(item.color ? Color.greyCell : Color.clear)
                        .padding([.leading, .trailing], 12)
                }
                .background(Color.clear)
                .scrollContentBackground(.hidden)
                .scrollDisabled(true)
                .onReceive(timer) { _ in
                    model.update()
                }
                
                Spacer()
                
                GeometryReader { _ in }
                    .frame(height: 96)
                    .background(Color.backgroundTabBar)
            }
        }
        .ignoresSafeArea()
    }
    
        
}

#Preview {
    TopView(model: TopModel())
}
