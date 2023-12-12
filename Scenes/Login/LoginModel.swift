//
//  LoginModel.swift
//  TradeTest
//
//  Created by Rodomil on 16.11.2023.
//

import Foundation
import SwiftUI

final class LoginModel: ObservableObject {
    @Published var widthIndicator = UIScreen.main.bounds.width - (38 * 2)
    @Published var complite = false
}
