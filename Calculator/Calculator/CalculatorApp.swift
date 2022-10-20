//
//  CalculatorApp.swift
//  Calculator
//
//  Created by Yash Patil on 24/09/22.
//

import SwiftUI

@main
struct CalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            CalcView()
                .preferredColorScheme(.dark)
                .environmentObject(LogicModel())
               
        }
    }
}
