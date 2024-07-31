//
//  ApplicationFlowCoordinator.swift
//  AlchemistGame
//
//  Created by Cagatay Ceker on 15.05.2024.
//

import Foundation
import UIKit

protocol ApplicationFlowCoordinatorProtocol {
    func start()
}

final class ApplicationFlowCoordinator: ApplicationFlowCoordinatorProtocol {
    
    private let window: UIWindow
    private let resolver: ApplicationFlowCoordinatorResolver
    private var alchemistGameFlowCoordinator: AlchemistGameFlowCoordinatorProtocol?
    
    init(window: UIWindow, resolver: ApplicationFlowCoordinatorResolver) {
        self.window = window
        self.resolver = resolver
    }
    
    func start() {
        alchemistGameFlowCoordinator = resolver.resolveAlchemistGameFlowCoordinator(window: self.window, delegate: self)
        alchemistGameFlowCoordinator?.start()
    }
}

extension ApplicationFlowCoordinator: AlchemistGameFlowCoordinatorDelegate {
    
}
