//
//  AlchemistGameResultPresenter.swift
//  AlchemistGame
//
//  Created by Cagatay Ceker on 20.05.2024.
//

import Foundation

protocol AlchemistGameResultPresenterProtocol {
    func presentAlchemistGameResult(selectedElements: [Element], outcome: Inventions?)
}

final class AlchemistGameResultPresenter: AlchemistGameResultPresenterProtocol {
    
    weak var viewController: AlchemistGameResultViewControllerProtocol?
    
    func presentAlchemistGameResult(selectedElements: [Element], outcome: Inventions?) {
        
        let viewModel = AlchemistGameResultViewModel(
            outcome: outcome?.rawValue ?? "No Result",
            selectedIcons: selectedElements.map { $0.rawValue },
            selectedElementCountTitle: "You chose \(selectedElements.count) elements!",
            infoLabel: "You've made a",
            restartButtonTitle: "Restart"
        )
        viewController?.displayViewModel(viewModel)
    }
}
