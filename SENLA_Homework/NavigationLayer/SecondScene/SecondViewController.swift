//
//  SecondController.swift
//  SENLA_Homework
//
//  Created by macbookbro on 04.07.2024.
//

import UIKit

class SecondViewController: UIViewController {
    
    private  let buttonStackView = UIStackView()
    private let displayLabel = UILabel()
    private var currentInput: String = "0"
    private var previousInput: String = ""
    private var operation: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        // Setup display label
        displayLabel.textAlignment = .right
        displayLabel.font = UIFont.systemFont(ofSize: 32)
        displayLabel.text = currentInput
        displayLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(displayLabel)
        
        NSLayoutConstraint.activate([
            displayLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            displayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            displayLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            displayLabel.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        // Setup buttons
        let buttons = [
            ["7", "8", "9", "+"],
            ["4", "5", "6", "-"],
            ["1", "2", "3", "*"],
            ["0", "C", "=", "/"]
        ]
        
        buttonStackView.axis = .vertical
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 10
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonStackView)
        
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: displayLabel.bottomAnchor, constant: 20),
            buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
        
        for row in buttons {
            let rowStackView = UIStackView()
            rowStackView.axis = .horizontal
            rowStackView.distribution = .fillEqually
            rowStackView.spacing = 10
            
            for buttonTitle in row {
                let button = UIButton(type: .system)
                button.setTitle(buttonTitle, for: .normal)
                button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
                button.backgroundColor = .lightGray
                button.layer.cornerRadius = 8
                button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
                rowStackView.addArrangedSubview(button)
            }
            
            buttonStackView.addArrangedSubview(rowStackView)
        }
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        guard let buttonTitle = sender.title(for: .normal) else { return }
        
        switch buttonTitle {
        case "0"..."9":
            handleNumberInput(buttonTitle)
        case "+", "-", "*", "/":
            handleOperation(buttonTitle)
        case "=":
            calculateResult()
        case "C":
            clear()
        default:
            break
        }
    }
    
    private func handleNumberInput(_ number: String) {
        if currentInput == "0" {
            currentInput = number
        } else {
            currentInput += number
        }
        updateDisplay()
    }
    
    private func handleOperation(_ op: String) {
        if !currentInput.isEmpty {
            previousInput = currentInput
            currentInput = "0"
            operation = op
        }
    }
    
    private func calculateResult() {
        guard !previousInput.isEmpty, !currentInput.isEmpty, !operation.isEmpty else { return }
        
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
                        displayError()
                        return
                    }
                default:
                    break
                }
                
                currentInput = String(result)
                previousInput = ""
                operation = ""
                updateDisplay()
            }
            
            private func clear() {
                currentInput = "0"
                previousInput = ""
                operation = ""
                updateDisplay()
            }
            
            private func updateDisplay() {
                displayLabel.text = currentInput
            }
            
            private func displayError() {
                displayLabel.text = "Error"
            }
        }
