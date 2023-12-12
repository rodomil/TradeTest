//
//  LoginUI.swift
//  TradeTest
//
//  Created by Rodomil on 16.11.2023.
//

import SwiftUI
import UserNotifications

struct LoginUI: View {
    let center = UNUserNotificationCenter.current()
    @ObservedObject var model: LoginModel
    var body: some View {
        if model.complite {
            TabBar()
        } else {
            ZStack(alignment: .center) {
                Image("logoFon")
                    .background(Color.baground)
                Indicatior(model: model)
                    .frame(width: model.widthIndicator, height: 24)
                    .background(Color.loadFon)
                    .cornerRadius(30)
            }
            
            
        }
    }
}

#Preview {
    LoginUI(model: LoginModel())
}
