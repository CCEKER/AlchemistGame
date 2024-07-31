//
//  ApplicationFlowCoordinatorModule.swift
//  AlchemistGame
//
//  Created by Cagatay Ceker on 15.05.2024.
//

import Foundation
import Swinject

protocol ApplicationFlowCoordinatorResolver {
    func resolveAlchemistGameFlowCoordinator(window: UIWindow, delegate: AlchemistGameFlowCoordinatorDelegate) -> AlchemistGameFlowCoordinatorProtocol
}

final class ApplicationFlowCoordinatorModule: ApplicationFlowCoordinatorResolver {
    
    private let container: Container
    
    init(parentContainer: Container) {
        container = Container(parent: parentContainer)
        _ = Assembler([ApplicationFlowCoordinatorAssembly()], container: container)
    }
    
    func resolveAlchemistGameFlowCoordinator(window: UIWindow, delegate: AlchemistGameFlowCoordinatorDelegate) -> AlchemistGameFlowCoordinatorProtocol {
        AlchemistGameFlowCoordinator.build(window: window, delegate: delegate, container: container)
    }
}
