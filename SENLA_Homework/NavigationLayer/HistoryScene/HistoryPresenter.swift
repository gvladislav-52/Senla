//
//  HistoryPresenter.swift
//  SENLA_Homework
//
//  Created by macbookbro on 05.07.2024.
//


import Foundation

class HistoryPresenter {
    
    private weak var view: HistoryViewController?
    private var models: [FirstModel] = []
    
    init(view: HistoryViewController) {
        self.view = view
        NotificationCenter.default.addObserver(self, selector: #selector(handleModelCountDidChange), name: .modelCountDidChange, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func viewDidLoad() {
        // Инициализация первой модели для примера
        var initialModel = FirstModel()
        initialModel.start(number: Int.random(in: 1...3))
        initialModel.statusYour = [.rock, .paper, .scissir].randomElement()
        models.append(initialModel)
    }
    
    @objc private func handleModelCountDidChange() {
        // Добавляем новую модель при изменении количества
        var newModel = FirstModel()
        newModel.start(number: Int.random(in: 1...3))
        newModel.statusYour = [.rock, .paper, .scissir].randomElement()
        models.append(newModel)
        
        // Обновляем данные во view
        view?.reloadData()
    }
    
    var modelsCount: Int {
        return models.count
    }
    
    func model(at index: Int) -> FirstModel {
        return models[index]
    }
}
