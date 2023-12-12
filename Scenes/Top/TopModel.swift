//
//  TopModel.swift
//  TradeTest
//
//  Created by Rodomil on 16.11.2023.
//

import Foundation
import SwiftUI

final class TopModel: ObservableObject {
    private let flags = ["ac", "ad", "ae", "af", "ag", "ai", "al", "am", "ao", "aq"]
    private let names = ["Alex", "Tim", "Nik", "Maria", "Nikita", "Dima", "Vlad", "Anya", "Kim", "Felix"]
    @Published var list = [TopStruct]()
    let header = TopStruct(nomer: 0, flag: "", name: "", deposit: 0, profit: 0, color: true)
    let headerText = "TOP 10 Traders"
    init() {
        list = topList()
        
    }
    
    func update() {
        list.remove(at: 0)
        for (index, item) in list.enumerated() {
            list[index].profit = item.profit + Int.random(in: -50...150)
        }
        list.sort { $0.profit > $1.profit}
        for (index, _) in list.enumerated() {
            list[index].nomer = index + 1
            if (list[index].nomer % 2) == 0 { list[index].color = true }
        }
        list.insert(header, at: 0)
    }

    private func topList() -> [TopStruct] {
        var arr = [TopStruct]()
        for i in 0...9 {
            let item = TopStruct(nomer: i + 1, 
                                 flag: flags.randomElement() ?? "ac",
                                 name: names.randomElement() ?? "Alex",
                                 deposit: Int.random(in: 100..<10000),
                                 profit: Int.random(in: 100..<10000))
            arr.append(item)
        }
        arr.sort { $0.profit > $1.profit}
        for (index, _) in arr.enumerated() {
            arr[index].nomer = index + 1
            if ((index + 1) % 2) == 0 { arr[index].color = true }
        }
        arr.insert(header, at: 0)
        return arr
    }
}
