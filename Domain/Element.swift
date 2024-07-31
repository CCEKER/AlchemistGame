//
//  Element.swift
//  AlchemistGame
//
//  Created by Cagatay Ceker on 16.05.2024.
//

import Foundation

enum Element: String, Comparable {
   
    static func < (lhs: Element, rhs: Element) -> Bool {
        lhs.rawValue == rhs.rawValue
    }
    
    case fire = "Fire"
    case water = "Water"
    case air = "Air"
    case earth = "Earth"
}

enum Inventions: String {
    case steam = "Steam"
    case smoke = "Smoke"
    case lava = "Lava"
    case mud = "Mud"
    case rain = "Rain"
    case dust = "Dust"
    case volcano = "Volcano"
    case plant = "Plant"
    case acidRain = "Acid Rain"
    case none
}
