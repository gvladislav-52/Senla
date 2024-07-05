//
//  FirstViewController.swift
//  SENLA_Homework
//
//  Created by macbookbro on 04.07.2024.
//

import UIKit

class FirstViewController: UIViewController {

    // MARK: - UI Elements
    private var isRevansh: Bool = true
    private var labelWinner: UILabel!
    private var labelOpenent: UILabel!
    private var label: UILabel!
    private var imageViewRock: UIImageView
    private var imageViewPaper: UIImageView
    private var imageViewScissors: UIImageView
    private var button = UIButton(type: .infoDark)
    private var presenter: FirstPresenter!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        presenter = FirstPresenter(view: self, model: FirstModel())
        setupLayout()
    }
    
    
    @objc private func leftButtonTapped() {
        // Действие для левой кнопки
        print("Left button tapped")
    }
    
    @objc private func rightButtonTapped() {
        // Действие для правой кнопки
        print("Right button tapped")
    }
    
    // MARK: - Initializer
        init() {
            // Initialize UI elements\
            //customNavigationBar = CustomNavigationBar()
            labelWinner = UILabel()
            labelOpenent = UILabel()
            label = UILabel()
            imageViewRock = UIImageView()
            imageViewPaper = UIImageView()
            imageViewScissors = UIImageView()
            button = UIButton(type: .system)

            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    private func setupLayout() {
        setupTitle()
        setupImageViewRock()
        setupImageViewPaper()
        setupImageViewScissors()
        setupButton()
        setupTitleWinner()
        setupTitleOponent()
        
    }
    func facebookPress() {
        print("facebook")
    }
    
    func googlePlusPress() {
        print("google-plus")
    }

    private func setupTitle() {
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Камень, Ножницы, Бумага"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupImageViewRock() {
        view.addSubview(imageViewRock)
        imageViewRock.translatesAutoresizingMaskIntoConstraints = false
        imageViewRock.contentMode = .scaleAspectFit
        imageViewRock.image = UIImage(named: "rook")
        
        NSLayoutConstraint.activate([
            imageViewRock.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -60),
            imageViewRock.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageViewRock.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        addTapGestureToImageViewRock()
    }

    private func addTapGestureToImageViewRock() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleImageTapRock))
        imageViewRock.isUserInteractionEnabled = true
        imageViewRock.addGestureRecognizer(tapGesture)
    }

    @objc private func handleImageTapRock() {
        presenter.didHandleImageTapRock()
        label.text = "Камень"
    }

    private func setupImageViewPaper() {
        view.addSubview(imageViewPaper)
        imageViewPaper.translatesAutoresizingMaskIntoConstraints = false
        imageViewPaper.contentMode = .scaleAspectFit
        imageViewPaper.image = UIImage(named: "book")
        
        NSLayoutConstraint.activate([
            imageViewPaper.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageViewPaper.trailingAnchor.constraint(equalTo: imageViewRock.leadingAnchor, constant: 40),
            imageViewPaper.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        addTapGestureToImageViewPaper()
    }

    private func addTapGestureToImageViewPaper() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleImageTapPaper))
        imageViewPaper.isUserInteractionEnabled = true
        imageViewPaper.addGestureRecognizer(tapGesture)
    }

    @objc private func handleImageTapPaper() {
        presenter.didHandleImageTapPaper()
        label.text = "Бумага"
    }

    private func setupImageViewScissors() {
        view.addSubview(imageViewScissors)
        imageViewScissors.translatesAutoresizingMaskIntoConstraints = false
        imageViewScissors.contentMode = .scaleAspectFit
        imageViewScissors.image = UIImage(named: "scessis")
        
        NSLayoutConstraint.activate([
            imageViewScissors.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageViewScissors.leadingAnchor.constraint(equalTo: imageViewRock.trailingAnchor, constant: -40),
            imageViewScissors.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        addTapGestureToImageViewScissors()
    }

    private func addTapGestureToImageViewScissors() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleImageTapScissors))
        imageViewScissors.isUserInteractionEnabled = true
        imageViewScissors.addGestureRecognizer(tapGesture)
    }

    @objc private func handleImageTapScissors() {
        presenter.didHandleImageTapScissors()
        label.text = "Ножницы"
    }
    
    private func setupButton() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Давай сыграем!", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true

        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 150),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupTitleWinner() {
        view.addSubview(labelWinner)
        labelWinner.translatesAutoresizingMaskIntoConstraints = false
        labelWinner.text = nil
        labelWinner.textColor = .red
        labelWinner.font = .systemFont(ofSize: 36, weight: .bold)
        labelWinner.textAlignment = .center
        
        NSLayoutConstraint.activate([
            labelWinner.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -30),
            labelWinner.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupTitleOponent() {
        view.addSubview(labelOpenent)
        labelOpenent.translatesAutoresizingMaskIntoConstraints = false
        labelOpenent.text = nil
        labelOpenent.textColor = .yellow
        labelOpenent.font = .systemFont(ofSize: 36, weight: .bold)
        labelOpenent.textAlignment = .center
        
        NSLayoutConstraint.activate([
            labelOpenent.topAnchor.constraint(equalTo: imageViewRock.bottomAnchor, constant: 150),
            labelOpenent.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    // MARK: - Button Action
    @objc private func buttonTapped() {
        if isRevansh {
            guard let _ =  FirstModel.shared.statusYour else {return}
            labelOpenent.text =  FirstModel.shared.statusOponentString
            labelWinner.text =  FirstModel.shared.winnerMethod()
            button.setTitle("Давай реванш?", for: .normal)
            button.backgroundColor = .green
            isRevansh = false
        } else
        {
            presenter.clearAllStatus()
            label.text = nil
            labelOpenent.text = nil
            labelWinner.text = nil
            button.setTitle("Давай сыграем!", for: .normal)
            button.backgroundColor = .systemBlue
            isRevansh = true
            label.text = "Камень, Ножницы, Бумага"
        }
    }
}
