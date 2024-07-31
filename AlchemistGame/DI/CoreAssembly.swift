//
//  CoreAssembly.swift
//  AlchemistGame
//
//  Created by Cagatay Ceker on 15.05.2024.
//

import Foundation
import Swinject

final class CoreAssembly: Assembly {
    
    func assemble(container: Swinject.Container) {
        container.register(ElementServiceProtocol.self) { _ in
            ElementService()
        }
    }
}
