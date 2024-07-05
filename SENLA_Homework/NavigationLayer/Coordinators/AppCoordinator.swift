//
//  AppCoordinator.swift
//  SENLA_Homework
//
//  Created by macbookbro on 04.07.2024.
//

import UIKit

class AppCoordinator: Coordinator {

    override func start() {
        showMainFlow()
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}

private extension AppCoordinator {
    
    func showMainFlow() {
        guard let navigationController = navigationController else {return}
        
        let firstNavigationController = UINavigationController()
        let firstCoordinator = FirstCoordinator(type: .first, navigationController: firstNavigationController)
        firstNavigationController.tabBarItem = UITabBarItem(title: "FIRST", image: nil,tag:0)
        firstCoordinator.finishDelegate = self
        firstCoordinator.start()
        
        let secondNavigationController = UINavigationController()
        let secondCoordinator = SecondCoordinator(type: .second, navigationController: secondNavigationController)
        secondNavigationController.tabBarItem = UITabBarItem(title: "SECOND", image: nil,tag:1)
        secondCoordinator.finishDelegate = self
        secondCoordinator.start()
        
        let textAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)]
        firstNavigationController.tabBarItem.setTitleTextAttributes(textAttributes, for: .normal)
        secondNavigationController.tabBarItem.setTitleTextAttributes(textAttributes, for: .normal)
        
        addChildCoordinator(firstCoordinator)
        addChildCoordinator(secondCoordinator)
        
        let tabBarControllers = [firstNavigationController, secondNavigationController]
        let tabBarController = TabBarController(tabBarControllers: tabBarControllers)
        
        navigationController.pushViewController(tabBarController, animated: true)
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinator)
    }
}


