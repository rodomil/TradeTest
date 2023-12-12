//
//  TopStruct.swift
//  TradeTest
//
//  Created by Rodomil on 16.11.2023.
//

import Foundation

struct TopStruct: Identifiable {
    let id = UUID()
    var nomer: Int
    let flag: String
    let name: String
    let deposit: Int
    var profit: Int
    var color: Bool = false
}
