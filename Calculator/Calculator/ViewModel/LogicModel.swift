//
//  LogicModel.swift
//  Calculator
//
//  Created by Yash Patil on 26/09/22.
//

import Foundation
import SwiftUI

class LogicModel  : ObservableObject {
    
    
    @Published var DisplayText : String = ""
    @Published var ExecuteOnce : Bool = true
    @Published var runningOperation : Operations = .plus
    @Published var runningNumber : Int = 0
    @Published var initialNumber : Double = 0.0
      
    init() { }
    
    enum IntorDouble {
        case int(Int)
        case double(Double)
    }
    
    enum Operations : String {
        
        case zero = "0"
        case one = "1"
        case two = "2"
        case three = "3"
        case four = "4"
        case five = "5"
        case six = "6"
        case seven = "7"
        case eight = "8"
        case nine = "9"
        case clear = "C"
        case multiply = "x"
        case divide = "/"
        case minus = "-"
        case plus = "+"
        case equal = "="
        case negation = "+/-"
        case percentage = "%"
        case point = "."
    }
    
        
    
    let allOperators : [[Operations]] = [
        [.clear,.negation,.percentage,.divide],
        [.one,.two,.three,.multiply],
        [.four,.five,.six,.minus],
        [.seven,.eight,.nine,.plus],
        [.zero,.point,.equal]
    ]
    

    func Calculation(item: Operations) {
        
        
        switch item {
        case .one,.two,.three,.four: NumberInterpolation(item: item)
        case .five,.six,.seven,.eight: NumberInterpolation(item: item)
        case .nine,.zero: NumberInterpolation(item: item)
       default : PerformOperation(item: item)
        }
    }
    
    func PerformOperation(item : Operations) {
        
        switch item {
            
        case  .clear : Clear()
        case  .negation: Negation()
            
        case .percentage: runningOperation = .percentage
                           AssigningNumbers()
            
        case .divide : runningOperation = .divide
                       AssigningNumbers()
            
        case .multiply : runningOperation = .multiply
                         AssigningNumbers()
            
        case .minus:  runningOperation = .minus
                      AssigningNumbers()
            
        case .plus :  runningOperation = .plus
                       AssigningNumbers()
                    
        case .equal :
            
            let RunNum = initialNumber
            let RunNum2 = CheckPoint() ? Double(AnyString: (DisplayText + "0"))! : Double(AnyString: DisplayText)!
            
            switch runningOperation  {
            case .plus :
                let roundValue = round((RunNum + RunNum2) * 1000) / 1000.0
                self.DisplayText = String(roundValue)
            case .minus :
                let roundValue = round((RunNum - RunNum2) * 1000) / 1000.0
                self.DisplayText = String(roundValue)
            case .multiply:
                let roundValue = round((RunNum * RunNum2) * 1000) / 1000.0
                self.DisplayText = String(roundValue)
            case .divide :
                let roundValue = round((RunNum / RunNum2) * 1000) / 1000.0
                self.DisplayText = String(roundValue)
                
            case .percentage :
                let roundValue = round(((RunNum / RunNum2) * 100) * 1000) / 1000.0
                self.DisplayText = String(roundValue)
           
            default : print("Nothing more than this")
            }
            
        case .point : ApplyPoint(item: item)
        default : print("Default Value for calculator View.")
            break
        }
    }
    
    func AssigningNumbers() {
        withAnimation(.easeOut) {
            if DisplayText.hasSuffix(".") {
                let DisplayText = DisplayText + "0"
                initialNumber = Double(AnyString:DisplayText)!
            }else {
                initialNumber = Double(AnyString:DisplayText)!
               
            }
            Clear()
        }
    }
    
    
    func Clear() {
        ExecuteOnce = true
        DisplayText = "0"
    }
    
    func Negation() {
        if DisplayText.contains(".") {
            if let negateText = Double(AnyString: DisplayText) {
                DisplayText = String(negateText.negation())
            }
        }else {
            if let negateText = Int(AnyString:DisplayText) {
                DisplayText = String(negateText.negation())
            }
        }
    }
    
    func ApplyPoint(item : Operations) {
        
        if ExecuteOnce {
            
            DisplayText += item.rawValue
            ExecuteOnce = false
        }
    }
    
    func NumberInterpolation(item:Operations) {
        
        // This if condition will only execute once
        if DisplayText == "0"
        {
                DisplayText = item.rawValue
        }
        else {
            DisplayText += item.rawValue
        }
    }
    
    func CheckPoint() -> Bool {
        if DisplayText.hasSuffix(".") {
             return true
            
        }else {
            return false
        }
    }
   
    
    
}
