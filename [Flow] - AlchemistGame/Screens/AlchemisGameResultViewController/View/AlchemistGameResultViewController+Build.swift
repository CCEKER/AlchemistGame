//
//  AlchemistGameResultViewController+Build.swift
//  AlchemistGame
//
//  Created by Cagatay Ceker on 20.05.2024.
//

import Foundation
import UIKit

extension AlchemistGameResultViewController {
    static func build(coordinator: AlchemistGameResultInteractorCoordinatorDelegate, selectedElements: [Element], elementService: ElementServiceProtocol) -> UIViewController {
        let presenter = AlchemistGameResultPresenter()
        let interactor = AlchemistGameResultInteractor(presenter: presenter, selectedElements: selectedElements, elementService: elementService)
        interactor.coordinator = coordinator
        let viewController = AlchemistGameResultViewController(interactor: interactor)
        presenter.viewController = viewController
        return viewController
    }
}
