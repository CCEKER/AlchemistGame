//
//  AlchemistGameFlowCoordinator.swift
//  AlchemistGame
//
//  Created by Cagatay Ceker on 15.05.2024.
//

import Foundation
import UIKit

protocol AlchemistGameFlowCoordinatorProtocol {
    func start()
}

protocol AlchemistGameFlowCoordinatorDelegate {
    
}

final class AlchemistGameFlowCoordinator: AlchemistGameFlowCoordinatorProtocol {
    
    private let window: UIWindow
    private let delegate: AlchemistGameFlowCoordinatorDelegate
    private let resolver: AlchemistGameFlowCoordinatorResolver
    private var navigationController = UINavigationController()
    
    init(window: UIWindow, delegate: AlchemistGameFlowCoordinatorDelegate, resolver: AlchemistGameFlowCoordinatorResolver) {
        self.window = window
        self.delegate = delegate
        self.resolver = resolver
    }
    
    func start() {
        let alchemistGameViewController = resolver.resolveAlchemistGameViewController(delegate: self)
        navigationController.viewControllers = [alchemistGameViewController]
        self.window.rootViewController = navigationController
    }
}

extension AlchemistGameFlowCoordinator: AlchemistGameInteractorCoordinatorDelegate {
    
    func didTapCombineButton(selectedElements: [Element]) {
        let alchemistGameResultViewController = resolver.resolveAlchemistGameResultViewController(delegate: self, selectedElements: selectedElements)
        self.navigationController.pushViewController(alchemistGameResultViewController, animated: true)
    }
}

extension AlchemistGameFlowCoordinator: AlchemistGameResultInteractorCoordinatorDelegate {
    
    func didTapRestartButton() {
        self.navigationController.popToRootViewController(animated: true)
    }
}
