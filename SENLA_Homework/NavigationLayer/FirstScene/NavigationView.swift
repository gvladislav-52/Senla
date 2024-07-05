import UIKit

class CustomNavigationBar: UIView {
    
    // MARK: - UI Elements
    private let leftButton: UIButton
    private let rightButton: UIButton
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        leftButton = UIButton(type: .system)
        rightButton = UIButton(type: .system)
        
        super.init(frame: frame)  
        
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup View
    private func setupView() {
        backgroundColor = .darkGray
        
        leftButton.setTitle("Left", for: .normal)
        rightButton.setTitle("Right", for: .normal)
        
        addSubview(leftButton)
        addSubview(rightButton)
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            leftButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            leftButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            rightButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            rightButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    // MARK: - Button Actions
    func setLeftButtonAction(target: Any?, action: Selector) {
        leftButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func setRightButtonAction(target: Any?, action: Selector) {
        rightButton.addTarget(target, action: action, for: .touchUpInside)
    }
}

