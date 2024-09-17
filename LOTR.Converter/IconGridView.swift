//
// File: IconGridView.swift
// Project: LOTR.Converter
// 
// Created by SCOTT CROWDER on 9/16/24.
// 
// Copyright © Playful Logic Studios, LLC 2024. All rights reserved.
// 


import SwiftUI

struct IconGridView: View {
    
    @Binding var selectedCurrency: Currency
    
    let columns: [GridItem] = [
        GridItem(),
        GridItem(),
        GridItem()
    ]
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(Currency.allCases) { currency in
                if selectedCurrency == currency {
                    CurrencyIcon(image: currency.image, currencyName: currency.currencyName)
                        .shadow(radius: 10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 25.0)
                                .stroke(lineWidth: 3)
                                .opacity(0.5)
                        }
                } else {
                    CurrencyIcon(image: currency.image, currencyName: currency.currencyName)
                        .onTapGesture {
                            selectedCurrency = currency
                        }
                        .accessibilityAddTraits(.isButton)
                }
                
            }
        }
    }
}

#Preview {
    IconGridView(selectedCurrency: .constant(.copperPenny))
}
