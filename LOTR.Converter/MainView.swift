//
// File: ContentView.swift
// Project: LOTR.Converter
// 
// Created by SCOTT CROWDER on 9/13/24.
// 
// Copyright © Playful Logic Studios, LLC 2024. All rights reserved.
// 


import SwiftUI

struct MainView: View {
    
    @State private var fromValue: String = ""
    @State private var fromImage: String = "silverpiece"
    @State private var fromCurrency: String = "Silver Piece"
    
    @State private var toValue: String = ""
    @State private var toImage: String = "goldpiece"
    @State private var toCurrency: String = "Gold Piece"
    
    @State private var isShowingExchangeRates: Bool = false
    @State private var isShowingChangeCurrency: Bool = false
    
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
                        Button {
                            isShowingChangeCurrency = true
                        } label: {
                            Image(fromImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            Text(fromCurrency)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        
                        TextField("Amount", text: $fromValue)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.numberPad)
                            .padding(.horizontal)
                    }
                    
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
//                        .symbolEffect(.pulse)
                    
                    VStack {
                        Button {
                            isShowingChangeCurrency = true
                        } label: {
                            Text(toCurrency)
                                .font(.headline)
                                .keyboardType(.numberPad)
                                .foregroundStyle(.white)
                            Image(toImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }
                        
                        TextField("Amount", text: $toValue)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .padding(.horizontal)
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
        .background(Color.brown)
        .sheet(isPresented: $isShowingExchangeRates) {
            ExchangeRatesView()
        }
        .sheet(isPresented: $isShowingChangeCurrency) {
            ChangeCurrencyView()
        }
    }
}

#Preview {
    MainView()
}
