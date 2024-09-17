//
// File: ContentView.swift
// Project: LOTR.Converter
// 
// Created by SCOTT CROWDER on 9/13/24.
// 
// Copyright © Playful Logic Studios, LLC 2024. All rights reserved.
//
// Additional features:
//      Add 6th currency
//      Persist curreny selections when app is closed
//      Dismiss keyboard
//      Refactor currency VStacks so that they use the same code


import SwiftUI
import TipKit

struct MainView: View {
    
    @State private var leftCurrency: Currency = .silverPiece
    @State private var leftValue: String = ""
    
    @State private var rightCurrency: Currency = .goldPiece
    @State private var rightValue: String = ""
    
    @State private var isShowingExchangeRates: Bool = false
    @State private var isShowingSelectCurrency: Bool = false
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                HStack {
                    VStack {
                        HStack {
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            Text(leftCurrency.currencyName)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .onTapGesture {
                            isShowingSelectCurrency = true
                        }
                        .accessibilityAddTraits(.isButton)
                        .popoverTip(CurrencyTip(), arrowEdge: .bottom)
                        
                        TextField("Amount", text: $leftValue)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.decimalPad)
                            .padding(.horizontal)
                            .focused($leftTyping)
                            .onChange(of: leftValue) { oldValue, newValue in
                                // could be moved to zstack because it is not explicitly tied to the textfield
                                if leftTyping {
                                    rightValue = leftCurrency.convert(leftValue, to: rightCurrency)
                                }
                            }
                    }
                    
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
//                        .symbolEffect(.pulse)
                    
                    VStack {
                        HStack {
                            Text(rightCurrency.currencyName)
                                .font(.headline)
                                .keyboardType(.numberPad)
                                .foregroundStyle(.white)
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }
                        .onTapGesture {
                            isShowingSelectCurrency = true
                        }
                        .accessibilityAddTraits(.isButton)
                        
                        TextField("Amount", text: $rightValue)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            .padding(.horizontal)
                            .focused($rightTyping)
                            .onChange(of: rightValue) { oldValue, newValue in
                                // could be moved to zstack because it is not explicitly tied to the textfield
                                if rightTyping {
                                    leftValue = rightCurrency.convert(rightValue, to: leftCurrency)
                                }
                            }
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.rect(cornerRadius: 30))
                
                Spacer()
                
                HStack{
                    Spacer()
                    
                    Button {
                        isShowingExchangeRates = true
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.title)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                }
            }
        }
        .task {
            do {
                try Tips.configure()
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
        .background(Color.brown)
        .onChange(of: leftCurrency) { oldValue, newValue in
            // recalculate conversion when user changes denomination
            leftValue = rightCurrency.convert(rightValue, to: leftCurrency)
        }
        .onChange(of: rightCurrency) { oldValue, newValue in
            // recalculate conversion when user changes denomination
            rightValue = leftCurrency.convert(leftValue, to: rightCurrency)
        }
        .fullScreenCover(isPresented: $isShowingExchangeRates) {
            ExchangeRatesView()
        }
        .fullScreenCover(isPresented: $isShowingSelectCurrency) {
            SelectCurrencyView(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
        }
    }
}

#Preview {
    MainView()
}
