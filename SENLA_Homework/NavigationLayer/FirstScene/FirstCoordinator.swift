//
//  FirstCoordinator.swift
//  SENLA_Homework
//
//  Created by macbookbro on 04.07.2024.
//

import UIKit

class FirstCoordinator: Coordinator {
    override func start() {
        let vc = FirstViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("FirstCoordinator finish")
    }
}
