//
// File: CurrencyTip.swift
// Project: LOTR.Converter
// 
// Created by SCOTT CROWDER on 9/17/24.
// 
// Copyright © Playful Logic Studios, LLC 2024. All rights reserved.
// 


import Foundation
import TipKit

struct CurrencyTip: Tip {
    var title: Text = Text("Change currency")
    
    var message: Text? {
        Text("You can tap the left or right currency to bring up the Select Currency screen.")
    }

    
}
