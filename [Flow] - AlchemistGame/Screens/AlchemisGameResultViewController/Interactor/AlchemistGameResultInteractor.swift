//
//  AlchemistGameResultInteractor.swift
//  AlchemistGame
//
//  Created by Cagatay Ceker on 20.05.2024.
//

import Foundation

protocol AlchemistGameResultInteractorProtocol {
    func viewDidLoad()
}

protocol AlchemistGameResultInteractorCoordinatorDelegate: AnyObject {
    func didTapRestartButton()
}

final class AlchemistGameResultInteractor {
    
    private let presenter: AlchemistGameResultPresenterProtocol
    private let selectedElements: [Element]
    private let elementService: ElementServiceProtocol
    weak var coordinator: AlchemistGameResultInteractorCoordinatorDelegate?
    
    init(presenter: AlchemistGameResultPresenterProtocol, selectedElements: [Element], elementService: ElementServiceProtocol) {
        self.presenter = presenter
        self.selectedElements = selectedElements
        self.elementService = elementService
    }
}

extension AlchemistGameResultInteractor: AlchemistGameResultInteractorProtocol {
    
    func viewDidLoad() {
        let outcome = elementService.getResult(input: selectedElements)
        presenter.presentAlchemistGameResult(selectedElements: selectedElements, outcome: outcome)
    }
}
