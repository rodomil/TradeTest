//
//  TabBar.swift
//  TradeTest
//
//  Created by Rodomil on 16.11.2023.
//

import SwiftUI

struct TabBar: View {
    @State private var tabSelection = 1
    var body: some View {
        TabView(selection: $tabSelection) {
            TabBarRoute.tradeView.go()
            .tabItem {
                    Label {
                        Text("Trade")
                    } icon: {
                        if tabSelection == 1 { Image("trade") } else { Image("trade-off") }
                    }
            }
            .tag(1)
            
            TabBarRoute.topView.go()
            .tabItem {
                Label {
                    Text("Top")
                } icon: {
                    if tabSelection == 2 { Image("top") } else { Image("top-off") }
                }
            }
            .tag(2)

        }
        .background(Color.clear)
        .background(Color.backgroundTabBar)
    }
}

#Preview {
    TabBar()
}
