//
//  Rocket.swift
//  RocketsDomain
//
//  Created by Marco Domingues on 09/06/2021.
//

import Foundation

public struct Rocket {
    
    public let name: String?
    public let country: String?
    public let description: String?
    public let isActive: Bool
    public let cost: Float?
    public let firstFlightDate: Date?
    public let successRatePercentage: Int?
    public let rocketImageURL: URL?
    public let wikipediaURL: URL?
    
    public init(name: String?, country: String?, description: String?, isActive: Bool, cost: Float?, firstFlightDate: Date?, successRatePercentage: Int?, rocketImageURL: URL?, wikipediaURL: URL?) {
        self.name = name
        self.country = country
        self.description = description
        self.isActive = isActive
        self.cost = cost
        self.firstFlightDate = firstFlightDate
        self.successRatePercentage = successRatePercentage
        self.rocketImageURL = rocketImageURL
        self.wikipediaURL = wikipediaURL
    }
    
}
