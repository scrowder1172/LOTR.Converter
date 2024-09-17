//
// File: ChangeCurrencyView.swift
// Project: LOTR.Converter
// 
// Created by SCOTT CROWDER on 9/13/24.
// 
// Copyright © Playful Logic Studios, LLC 2024. All rights reserved.
// 


import SwiftUI

struct SelectCurrencyView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Binding var topCurrency: Currency
    @Binding var bottomCurrency: Currency
    
    var body: some View {
        ZStack {
            
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                VStack{
                    Text("Select the currency you are you starting with:")
                        .fontWeight(.bold)
                    
                    HStack {
                        
                    }
                }
                
                IconGridView(selectedCurrency: $topCurrency)
                
                VStack {
                    Text("Select the currency you would like to convert to:")
                        .fontWeight(.bold)
                }
                
                IconGridView(selectedCurrency: $bottomCurrency)
                
                Button("Done") {
                    dismiss()
                }
                .font(.largeTitle)
                .foregroundStyle(.white)
                .padding(6)
                .background(.brown)
                .clipShape(.rect(cornerRadius: 10))
                
                // Currency icons
            }
            .padding()
            .multilineTextAlignment(.center)
            
        }
        .background(Color.brown)
    }
}

#Preview {
    SelectCurrencyView(topCurrency: .constant(.copperPenny), bottomCurrency: .constant(.silverPenny))
}
