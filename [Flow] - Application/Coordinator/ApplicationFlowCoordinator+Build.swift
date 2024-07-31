//
//  ApplicationFlowCoordinator+Build.swift
//  AlchemistGame
//
//  Created by Cagatay Ceker on 15.05.2024.
//

import Foundation
import Swinject

extension ApplicationFlowCoordinator {
    static func build(window: UIWindow, container: Container) -> ApplicationFlowCoordinatorProtocol {
        let module = ApplicationFlowCoordinatorModule(parentContainer: container)
        return ApplicationFlowCoordinator(window: window, resolver: module)
    }
}
