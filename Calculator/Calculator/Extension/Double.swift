//
//  Double.swift
//  Calculator
//
//  Created by Yash Patil on 27/09/22.
//

import Foundation

extension Double {
    init?(AnyString:String)
    {
        guard
            let standardDouble = Double(AnyString),
            let firstChar : String.Element = AnyString.first,
            let lastChar : String.Element = AnyString.last,
            firstChar != "." && lastChar != "."
             else {return nil}
        
        self = standardDouble
       
        }
    
    
    func negation() -> Self {
        return (0-self)
    }
    }

