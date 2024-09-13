//
// File: ChangeCurrencyView.swift
// Project: LOTR.Converter
// 
// Created by SCOTT CROWDER on 9/13/24.
// 
// Copyright © Playful Logic Studios, LLC 2024. All rights reserved.
// 


import SwiftUI

struct ChangeCurrencyView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            
            Image(.parchment)
                .resizable()
            
            VStack {
                VStack{
                    Text("Select the currency you are you starting with:")
                        .font(.headline)
                    
                    HStack {
                        
                    }
                }
                
                VStack {
                    Text("Select the currency you would like to convert to:")
                        .font(.headline)
                }
                
                Button("Done") {
                    dismiss()
                }
                .font(.largeTitle)
                .foregroundStyle(.white)
                .padding(6)
                .background(.brown)
                .clipShape(.rect(cornerRadius: 10))
            }
            
            
        }
        .background(Color.brown)
    }
}

#Preview {
    ChangeCurrencyView()
}
