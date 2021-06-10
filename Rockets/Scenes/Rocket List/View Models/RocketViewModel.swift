//
//  RocketViewModel.swift
//  Rockets
//
//  Created by Marco Domingues on 10/06/2021.
//

import Foundation
import RocketsDomain

struct RocketViewModel {
    
    let name: String?
    
    init(rocket: Rocket) {
        self.name = rocket.name
    }
    
}
