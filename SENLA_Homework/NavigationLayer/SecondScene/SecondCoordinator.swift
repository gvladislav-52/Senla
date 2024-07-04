//
//  SecondCoordinator.swift
//  SENLA_Homework
//
//  Created by macbookbro on 04.07.2024.
//

import UIKit

class SecondCoordinator: Coordinator {
    override func start() {
        let vc = SecondController()
        vc.view.backgroundColor = .red
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("SecondCoordinator finish")
    }
}
