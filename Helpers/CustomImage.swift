//
//  CustomImage.swift
//  TradeTest
//
//  Created by Rodomil on 16.11.2023.
//

import SwiftUI

struct CustomImage: View {
    var image: String
    var size: CGFloat
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .frame(width: size, height: size)
    }
}
