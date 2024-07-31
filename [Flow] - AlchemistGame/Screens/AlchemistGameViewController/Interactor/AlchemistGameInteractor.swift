//
//  AlchemistGameInteractor.swift
//  AlchemistGame
//
//  Created by Cagatay Ceker on 15.05.2024.
//

import Foundation

protocol AlchemistGameInteractorProtocol {
    func viewDidLoad()
    func didTapElement(_ element: Element)
    func didTapCombineButton()
}

protocol AlchemistGameInteractorCoordinatorDelegate: AnyObject {
    func didTapCombineButton(selectedElements: [Element])
}

final class AlchemistGameInteractor {
    
    private let presenter: AlchemistGamePresenterProtocol
    weak var coordinator: AlchemistGameInteractorCoordinatorDelegate?
    private var elements: [Element] = []
    private var selectedElements: [Element] = []
    
    init(presenter: AlchemistGamePresenterProtocol) {
        self.presenter = presenter
    }
}

extension AlchemistGameInteractor: AlchemistGameInteractorProtocol {
    
    func viewDidLoad() {
        elements = [
            .air,
            .earth,
            .fire,
            .water
        ]
        selectedElements = []
        presenter.presentElements(elements: elements, selectedElements: selectedElements)
    }
    
    func didTapElement(_ element: Element) {
        
        if let index = selectedElements.firstIndex(of: element) {
            selectedElements.remove(at: index)
        } else {
            if selectedElements.count < 3 {
                selectedElements.append(element)
            } else {
                return
            }
        }
        presenter.presentElements(elements: elements, selectedElements: selectedElements)
    }
    
    func didTapCombineButton() {
        coordinator?.didTapCombineButton(selectedElements: selectedElements)
    }
}
