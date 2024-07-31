//
//  AlchemistGamePresenter.swift
//  AlchemistGame
//
//  Created by Cagatay Ceker on 15.05.2024.
//

import Foundation

protocol AlchemistGamePresenterProtocol {
    func presentElements(elements: [Element], selectedElements: [Element])
}

final class AlchemistGamePresenter: AlchemistGamePresenterProtocol {
    
    
    weak var viewController: AlchemistGameViewControllerProtocol?
    
    func presentElements(elements: [Element], selectedElements: [Element]) {
        
        let viewModels = elements.map { element in
            ElementCellViewModel(
                isSelected: selectedElements.contains(element),
                element: element
            )
        }
        
        let isCombineButtonEnabled = selectedElements.count > 1 && selectedElements.count < 4
        
        viewController?.displayCellViewModels(viewModels, isCombineButtonEnabled: isCombineButtonEnabled)
    }
}
