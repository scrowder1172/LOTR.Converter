//
// File: ExchangeRatesView.swift
// Project: LOTR.Converter
// 
// Created by SCOTT CROWDER on 9/13/24.
// 
// Copyright © Playful Logic Studios, LLC 2024. All rights reserved.
// 


import SwiftUI

struct ExchangeRatesView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(3)
                    .padding(.vertical)
                
                Text(
"""
Here at the Prancing Pony, we are happy to offer you a place where can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:
""")
                .font(.title2)
                .padding()
                
                VStack{
                    HStackDescription(
                        fromImage: "goldpiece",
                        text: "1 Gold Piece = 4 Gold Pennies",
                        toImage: "goldpenny"
                    )
                    
                    HStackDescription(
                        fromImage: "goldpenny",
                        text: "1 Gold Penny = 4 Silver Pieces",
                        toImage: "silverpiece"
                    )
                    
                    HStackDescription(
                        fromImage: "silverpiece",
                        text: "1 Silver Piece = 4 Silver Pennies",
                        toImage: "silverpenny"
                    )
                    
                    HStackDescription(
                        fromImage: "silverpenny",
                        text: "1 Silver Penny = 100 Copper Pennies",
                        toImage: "copperpenny"
                    )
                }
                .padding()
                
                Button("Done") {
                    dismiss()
                }
                .font(.largeTitle)
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .padding()
                .foregroundStyle(.white)
            }
            .foregroundStyle(.black)
        }
        .background(Color.brown)
    }
}

#Preview {
    ExchangeRatesView()
}

struct HStackDescription: View {
    
    let fromImage: String
    let text: String
    let toImage: String
    
    var body: some View {
        HStack {
            Image(fromImage)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
            ScrollView(.horizontal){
                Text(text)
            }
            .scrollIndicators(.hidden)
            Image(toImage)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
        }
    }
}
