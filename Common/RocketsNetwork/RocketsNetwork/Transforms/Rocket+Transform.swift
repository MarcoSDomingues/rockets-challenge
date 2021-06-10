//
//  Rocket+Transform.swift
//  RocketsNetwork
//
//  Created by Marco Domingues on 10/06/2021.
//

import Foundation
import RocketsDomain

internal extension RocketResponse {
    
    func asRocket() -> Rocket {
        return Rocket(name: self.name)
    }
    
}

internal extension Sequence where Element == RocketResponse {
    
    func asRockets() -> [Rocket] {
        return self.map { $0.asRocket() }
    }
    
}
