//
//  SecondModel.swift
//  SENLA_Homework
//
//  Created by macbookbro on 05.07.2024.
//

import Foundation

struct CalculatorModel {
    var currentInput: String = ""
    var previousInput: String = ""
    var operation: String = ""
    var hasCalculatedResult = false
    
    mutating func clear() {
        currentInput = ""
        previousInput = ""
        operation = ""
        hasCalculatedResult = false
    }
    
    mutating func performOperation() -> String? {
        guard !previousInput.isEmpty, !currentInput.isEmpty, !operation.isEmpty else { return nil }
        
        let prevValue = Double(previousInput) ?? 0
        let currentValue = Double(currentInput) ?? 0
        var result: Double = 0
        
        switch operation {
        case "+":
            result = prevValue + currentValue
        case "-":
            result = prevValue - currentValue
        case "*":
            result = prevValue * currentValue
        case "/":
            if currentValue != 0 {
                result = prevValue / currentValue
            } else {
                return "Error"
            }
        default:
            return nil
        }
        
        currentInput = String(Int(result))
        previousInput = ""
        operation = ""
        hasCalculatedResult = true
        
        return currentInput
    }
}
