import UIKit

class SecondViewController: UIViewController {
    
    private let buttonStackView = UIStackView()
    private let displayLabel = UILabel()
    private var currentInput: String = ""
    private var previousInput: String = ""
    private var operation: String = ""
    private var hasCalculatedResult = false // New state variable
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        // Setup display label
        displayLabel.textAlignment = .right
        displayLabel.font = UIFont.systemFont(ofSize: 32)
        displayLabel.text = "0"
        displayLabel.numberOfLines = 0
        displayLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(displayLabel)
        
        NSLayoutConstraint.activate([
            displayLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            displayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            displayLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            displayLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        // Setup buttons
        let buttons = [
            ["7", "8", "9", "+"],
            ["4", "5", "6", "-"],
            ["1", "2", "3", "x"],
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
        case "+", "-", "x", "/":
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
        if hasCalculatedResult {
            // Clear current input if a result was already calculated
            currentInput = number
            hasCalculatedResult = false
        } else {
            if currentInput == "" && number == "0" {
                return // Prevent leading zeros
            }
            currentInput += number
        }
        updateDisplay()
    }
    
    private func handleOperation(_ op: String) {
        if !currentInput.isEmpty {
            if hasCalculatedResult {
                hasCalculatedResult = false
            }
            if !previousInput.isEmpty {
                            calculateResult()
                        }
                        previousInput = currentInput
                        currentInput = ""
                        operation = op
                        updateDisplay()
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
                    case "x":
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
                    
                    currentInput = String(Int(result))
                    previousInput = ""
                    operation = ""
                    hasCalculatedResult = true
                    updateDisplay()
                }
                
                private func clear() {
                    currentInput = ""
                    previousInput = ""
                    operation = ""
                    displayLabel.text = "0"
                    hasCalculatedResult = false
                }
                
                private func updateDisplay() {
                    if previousInput.isEmpty {
                        displayLabel.text = currentInput
                    } else {
                        displayLabel.text = "\(previousInput) \(operation) \(currentInput)"
                    }
                }
                
                private func displayError() {
                    displayLabel.text = "Error"
                    currentInput = ""
                    previousInput = ""
                    operation = ""
                    hasCalculatedResult = false
                }
            }
