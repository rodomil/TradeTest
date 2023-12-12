//
//  Int + Time.swift
//  TradeTest
//
//  Created by Rodomil on 16.11.2023.
//

import UIKit

extension Int {
    func getTime() -> String {
        var res = ""
        var time = self / 60
        if time > 9 { res = "\(time)" } else { res = "0\(time)" }
        time = self % 60
        if time > 9 { res += ":\(time)" } else { res += ":0\(time)" }
        return res
    }
}
