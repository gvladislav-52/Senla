//
//  FirstPresenter.swift
//  SENLA_Homework
//
//  Created by macbookbro on 05.07.2024.
//

import Foundation

class FirstPresenter {
    private weak var view: FirstViewController?
    private(set) var model: FirstModel?
    
    init(view: FirstViewController, model: FirstModel) {
        self.view = view
        self.model = model
    }
    
    func didHandleImageTapRock() {
        model?.start(number: 2)
        model?.statusYour = .rock
    }
    
    func didHandleImageTapPaper() {
        model?.start(number: 1)
        model?.statusYour = .paper
    }
    
    func didHandleImageTapScissors() {
        model?.start(number: 3)
        model?.statusYour = .scissir
    }
    
    func clearAllStatus() {
        model?.statusOponent = nil
        model?.statusYour = nil
    }
}
