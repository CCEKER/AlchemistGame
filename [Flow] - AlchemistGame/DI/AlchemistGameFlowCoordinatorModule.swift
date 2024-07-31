//
//  AlchemistGameFlowCoordinatorModule.swift
//  AlchemistGame
//
//  Created by Cagatay Ceker on 15.05.2024.
//

import Foundation
import Swinject

protocol AlchemistGameFlowCoordinatorResolver {
    func resolveAlchemistGameViewController(delegate: AlchemistGameInteractorCoordinatorDelegate) -> UIViewController
    func resolveAlchemistGameResultViewController(delegate: AlchemistGameResultInteractorCoordinatorDelegate, selectedElements: [Element]) -> UIViewController
}

final class AlchemistGameFlowCoordinatorModule: AlchemistGameFlowCoordinatorResolver {
    
    private let container: Container
    private let resolver: Resolver
    
    init(parentContainer: Container) {
        container = Container(parent: parentContainer)
        _ = Assembler([AlchemistGameFlowCoordinatorAssembly()], container: container)
        self.resolver = container
    }
    
    func resolveAlchemistGameViewController(delegate: AlchemistGameInteractorCoordinatorDelegate) -> UIViewController {
        AlchemistGameViewController.build(coordinator: delegate)
    }
    
    func resolveAlchemistGameResultViewController(delegate: AlchemistGameResultInteractorCoordinatorDelegate, selectedElements: [Element]) -> UIViewController {
        guard let elementService = resolver.resolve(ElementServiceProtocol.self) else {
            fatalError("ElementService is not registered.")
        }
        return AlchemistGameResultViewController.build(coordinator: delegate, selectedElements: selectedElements, elementService: elementService)
    }
}
