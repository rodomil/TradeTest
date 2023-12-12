//
//  TradeModel.swift
//  TradeTest
//
//  Created by Rodomil on 16.11.2023.
//

import SwiftUI

final class TradeModel: ObservableObject {
    let headerText = "Trade"
    let balanceText = "Balance"
    @Published var currentPair = "GPB / USD"
    let CurrencyPairTitle = "Currency pair"
    @Published var url = "https://www.tradingview.com/chart/?symbol=NASDAQ%3AGBP"
    
    let CurrencyPair = [PairStruct(name: "GPB / USD"), PairStruct(name: "EUR / USD"), PairStruct(name: "EUR / USD"), PairStruct(name: "EUR / USD"), PairStruct(name: "GPB / USD"), PairStruct(name: "EUR / USD"), PairStruct(name: "GPB / USD"), PairStruct(name: "EUR / USD"), PairStruct(name: "GPB / USD"), PairStruct(name: "EUR / USD"), PairStruct(name: "EUR / USD"), PairStruct(name: "GPB / USD")]
    
    func selectPair(pair: String) {
        switch pair {
        case "GPB / USD":
            url = "https://www.tradingview.com/chart/?symbol=NASDAQ%3AGBP"
            currentPair = "GPB / USD"
        default:
            url = "https://www.tradingview.com/chart/?symbol=BMFBOVESPA%3AEUR1%21"
            currentPair = "EUR / USD"
        }
    }
}
