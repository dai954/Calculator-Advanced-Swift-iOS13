//
//  CalcuratorLogic.swift
//  Calculator
//
//  Created by 石川大輔 on 2021/05/01.
//  Copyright © 2021 London App Brewery. All rights reserved.
//

import Foundation

struct CalcuratorLogic {
    
    private var number: Double?
    
    private var intermediateCaluculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        
        self.number = number
        
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
               return performTwoNumberCalculation(n2: n)
            default:
                intermediateCaluculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumberCalculation(n2: Double) -> Double? {
        
        if let n1 = intermediateCaluculation?.n1, let operation = intermediateCaluculation?.calcMethod {
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2

            default:
                fatalError("The operation passed in does not match any of the cases.")
            }
            
        }
        return nil
    }
    
}
