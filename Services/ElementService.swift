//
//  ElementService.swift
//  AlchemistGame
//
//  Created by Cagatay Ceker on 17.05.2024.
//

import Foundation

protocol ElementServiceProtocol {
    func getResult(input: [Element]) -> Inventions?
}

final class ElementService: ElementServiceProtocol {
    
    func getResult(input: [Element]) -> Inventions? {
        guard input.count >= 2 && input.count <= 3  else { return nil }
        
        let sortedElements = input.sorted(by: { $0.rawValue > $1.rawValue })
        
        switch sortedElements {
        case [.fire, .water].sorted(by: { $0.rawValue > $1.rawValue }):
            return .steam
        case [.fire, .air].sorted(by: { $0.rawValue > $1.rawValue }):
            return .smoke
        case [.fire, .earth].sorted(by: { $0.rawValue > $1.rawValue }):
            return .lava
        case [.water, .air].sorted(by: { $0.rawValue > $1.rawValue }):
            return .rain
        case [.water, .earth].sorted(by: { $0.rawValue > $1.rawValue }):
            return .mud
        case [.air, .earth].sorted(by: { $0.rawValue > $1.rawValue }):
            return .dust
        case [.fire, .water, .air].sorted(by: { $0.rawValue > $1.rawValue }):
            return .acidRain
        case [.fire, .water, .earth].sorted(by: { $0.rawValue > $1.rawValue }):
            return .plant
        case [.water, .air, .earth].sorted(by: { $0.rawValue > $1.rawValue }):
            return .volcano
        default:
            return nil
        }
    }
}
