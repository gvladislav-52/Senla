import UIKit

class SecondViewController: UIViewController, CalculatorView {
    
    private let buttonStackView = UIStackView()
    private let displayLabel = UILabel()
    private let buttons = [
        ["7", "8", "9", "+"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "*"],
        ["0", "C", "=", "/"]
    ]
    private var presenter: CalculatorPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        presenter = CalculatorPresenter(view: self, model: CalculatorModel())
        setupLabel()
        setupButtonStack()
    }
    
    private func setupLabel() {
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
    }
    
    private func setupButtonStack() {
        
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
            presenter.didTapNumber(buttonTitle)
        case "+", "-", "*", "/":
            presenter.didTapOperation(buttonTitle)
        case "=":
            presenter.didTapEqual()
        case "C":
            presenter.didTapClear()
        default:
            break
        }
    }
    
    func updateDisplay(_ text: String) {
        displayLabel.text = text
    }
}
