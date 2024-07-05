//
//  File.swift
//  SENLA_Homework
//
//  Created by macbookbro on 05.07.2024.
//

import UIKit

class HistoryCoordinator: Coordinator {
    override func start() {
        let vc = HistoryViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("FirstCoordinator finish")
    }
}
