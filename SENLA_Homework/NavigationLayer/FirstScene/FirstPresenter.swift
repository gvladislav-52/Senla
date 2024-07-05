//
//  FirstPresenter.swift
//  SENLA_Homework
//
//  Created by macbookbro on 05.07.2024.
//

import Foundation

class FirstPresenter {
    private weak var view: FirstViewController?
    //private(set) var model: FirstModel?
    
    init(view: FirstViewController, model: FirstModel) {
        self.view = view
        //self.model = model
    }
    
    func didHandleImageTapRock() {
        FirstModel.shared.start(number: 2)
        FirstModel.shared.statusYour = .rock
    }
    
    func didHandleImageTapPaper() {
        FirstModel.shared.start(number: 1)
        FirstModel.shared.statusYour = .paper
    }
    
    func didHandleImageTapScissors() {
        FirstModel.shared.start(number: 3)
        FirstModel.shared.statusYour = .scissir
    }
    
    func clearAllStatus() {
        FirstModel.shared.statusOponent = nil
        FirstModel.shared.statusYour = nil
    }
}
