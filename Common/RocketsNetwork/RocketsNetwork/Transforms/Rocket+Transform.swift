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
        var imageURL: URL?
        if let urlString = self.flickrImages?.first {
            imageURL = URL(string: urlString)
        }
        
        var wikipediaURL: URL?
        if let urlString = self.wikipedia {
            wikipediaURL = URL(string: urlString)
        }
        
        return Rocket(name: self.name,
                      country: self.country,
                      description: self._description,
                      isActive: self.active ?? false,
                      cost: self.costPerLaunch,
                      firstFlightDate: self.firstFlight,
                      successRatePercentage: self.successRatePct,
                      rocketImageURL: imageURL,
                      wikipediaURL: wikipediaURL)
    }
    
}

internal extension Sequence where Element == RocketResponse {
    
    func asRockets() -> [Rocket] {
        return self.map { $0.asRocket() }
    }
    
}
