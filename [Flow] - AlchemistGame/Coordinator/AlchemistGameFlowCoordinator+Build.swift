//
//  AlchemistGameFlowCoordinator+Build.swift
//  AlchemistGame
//
//  Created by Cagatay Ceker on 15.05.2024.
//

import Foundation
import Swinject

extension AlchemistGameFlowCoordinator {
    static func build(window: UIWindow, delegate: AlchemistGameFlowCoordinatorDelegate, container: Container) -> AlchemistGameFlowCoordinatorProtocol {
        let module = AlchemistGameFlowCoordinatorModule(parentContainer: container)
        return AlchemistGameFlowCoordinator(window: window, delegate: delegate, resolver: module)
    }
}
