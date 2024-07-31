//
//  AlchemistGameViewController+Build.swift
//  AlchemistGame
//
//  Created by Cagatay Ceker on 15.05.2024.
//

import Foundation
import UIKit

extension AlchemistGameViewController {
    static func build(coordinator: AlchemistGameInteractorCoordinatorDelegate) -> UIViewController {
        let presenter = AlchemistGamePresenter()
        let interactor = AlchemistGameInteractor(presenter: presenter)
        interactor.coordinator = coordinator
        let viewController = AlchemistGameViewController(interactor: interactor)
        presenter.viewController = viewController
        return viewController
    }
}
