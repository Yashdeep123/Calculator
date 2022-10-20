//
//  Int.swift
//  Calculator
//
//  Created by Yash Patil on 27/09/22.
//

import Foundation

extension Int {
    
    init?(AnyString:String) {
        guard let standardInt = Int(AnyString),
              !AnyString.contains(".")
              else {return nil}
              self = standardInt
    }
    
    func negation() -> Self {
        return (0 - self)
    }
}
