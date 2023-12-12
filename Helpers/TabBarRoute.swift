//
//  TabBarRoute.swift
//  TradeTest
//
//  Created by Rodomil on 16.11.2023.
//

import SwiftUI

enum TabBarRoute {
    case topView
    case tradeView
    case pair(model: TradeModel)
    
    func go() -> AnyView {
        switch self {
        case .topView: return AnyView(TopView(model: TopModel()))
        case .tradeView: return AnyView(TradeView(model: TradeModel()))
        case .pair(let model): return AnyView(PairList(model: model))
        }
    }
}
