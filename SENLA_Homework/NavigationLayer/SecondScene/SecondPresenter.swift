//
//  SecondPresenter.swift
//  SENLA_Homework
//
//  Created by macbookbro on 05.07.2024.
//

import Foundation

protocol CalculatorView: AnyObject {
    func updateDisplay(_ text: String)
}

class CalculatorPresenter {
    private weak var view: CalculatorView?
    private var model: CalculatorModel
    
    init(view: CalculatorView, model: CalculatorModel) {
        self.view = view
        self.model = model
    }
    
    func didTapNumber(_ number: String) {
        if model.hasCalculatedResult {
            model.currentInput = number
            model.hasCalculatedResult = false
        } else {
            if model.currentInput == "" && number == "0" {
                return
            }
            model.currentInput += number
        }
        updateDisplay()
    }
    
    func didTapOperation(_ op: String) {
        if !model.currentInput.isEmpty {
            if model.hasCalculatedResult {
                model.hasCalculatedResult = false
            }
            if !model.previousInput.isEmpty {
                _ = model.performOperation()
            }
            model.previousInput = model.currentInput
            model.currentInput = ""
            model.operation = op
            updateDisplay()
        }
    }
    
    func didTapEqual() {
        if let result = model.performOperation() {
            if result == "Error" {
                view?.updateDisplay(result)
            } else {
                updateDisplay()
            }
        }
    }
    
    func didTapClear() {
        model.clear()
        view?.updateDisplay("0")
    }
    
    private func updateDisplay() {
        if model.previousInput.isEmpty {
            view?.updateDisplay(model.currentInput)
        } else {
            view?.updateDisplay("\(model.previousInput) \(model.operation) \(model.currentInput)")
        }
    }
}
