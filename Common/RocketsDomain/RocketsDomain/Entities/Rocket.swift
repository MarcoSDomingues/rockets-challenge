//
//  Rocket.swift
//  RocketsDomain
//
//  Created by Marco Domingues on 09/06/2021.
//

import Foundation

public struct Rocket {
    
    public let name: String?
    public let firstFlightDate: Date?
    public let successRatePercentage: Int?
    public let rocketImageURL: URL?
    
    public init(name: String?, firstFlightDate: Date?, successRatePercentage: Int?, rocketImageURL: URL?) {
        self.name = name
        self.firstFlightDate = firstFlightDate
        self.successRatePercentage = successRatePercentage
        self.rocketImageURL = rocketImageURL
    }
    
}
