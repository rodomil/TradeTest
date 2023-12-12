//
//  TradeView.swift
//  TradeTest
//
//  Created by Rodomil on 16.11.2023.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

struct TradeView: View {
    @ObservedObject var model: TradeModel
    var body: some View {
        NavigationView {
            ZStack(alignment: .center) {
                GeometryReader { _ in}
                    .background(Color.baground)
                
                VStack {
                    CustomText(text: model.headerText, colorText: .white, typeFont: .bold, size: 22)
                        .padding(.top, 64)
                    ZStack {
                        Rectangle()
                            .customRectangle()
                            .padding([.leading, .trailing], 30)
                        VStack {
                            CustomText(text: model.balanceText, colorText: .white, typeFont: .medium, size: 12)
                            CustomText(text: "10000", colorText: .white, typeFont: .bold, size: 16)
                                .padding(.top, 2)
                        }
                    }
                    WebView(url: URL(string: model.url)!)
                        .background(Color.baground)
                    
                    VStack {
                        NavigationLink(destination: PairList(model: model)) {
                            ZStack {
                                Rectangle()
                                    .customRectangle()
                                
                                CustomText(text: model.currentPair, colorText: .white, typeFont: .bold, size: 16)
                                    .padding(.top, 2)
                                HStack {
                                    Spacer()
                                    CustomImage(image: "arrow-left", size: 24)
                                        .padding(.trailing, 41)
                                }
                                
                            }
                        }
                       
                        HStack(spacing: 11) {
                            InputView(typeView: .timer)
                            InputView(typeView: .money)
                        }
                        HStack(spacing: 11) {
                            CustomButton(typeButtom: .red)
                            CustomButton(typeButtom: .green)
                        }
                    }
                    .padding([.leading, .trailing], 30)
                    
                    .keyboardAdaptive()
//                    Spacer()
                    
                    GeometryReader { _ in }
                        .frame(height: 96)
                        .background(Color.backgroundTabBar)
                }
            }
            .ignoresSafeArea()
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    HStack {
                        Spacer()
                        Button(action: {
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        }, label: {
                            Text("done")
                        })
                    }
                }
                
            }
        }
    }
        
}

#Preview {
    TradeView(model: TradeModel())
}


