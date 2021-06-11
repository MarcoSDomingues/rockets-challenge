//
//  RocketViewModel.swift
//  Rockets
//
//  Created by Marco Domingues on 10/06/2021.
//

import UIKit
import Foundation
import RocketsDomain

struct RocketViewModel {
    
    private(set) var name: String?
    private(set) var country: String?
    private(set) var cost: String?
    private(set) var isActive: Bool
    private(set) var description: String?
    private(set) var firstFlightDateString: String?
    private(set) var successRateString: String?
    private(set) var badgeColor: UIColor?
    private(set) var rocketImageURL: URL?
    private(set) var wikipediaURL: URL?
    
    init(rocket: Rocket) {
        self.name = rocket.name
        self.country = rocket.country
        self.cost = rocket.cost?.currency
        self.isActive = rocket.isActive
        self.description = rocket.description
        self.rocketImageURL = rocket.rocketImageURL
        self.wikipediaURL = rocket.wikipediaURL
        
        if let firstFlightDate = rocket.firstFlightDate {
            self.firstFlightDateString = String(format: "Flying since: %@", firstFlightDate.short)
        }
        
        if let successRatePercentage = rocket.successRatePercentage {
            self.successRateString = "\(successRatePercentage)%"
            
            switch successRatePercentage {
            case 0..<30:
                self.badgeColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
            case 30..<60:
                self.badgeColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            case 60...100:
                self.badgeColor = #colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1)
            default:
                break
            }
        }
    }
    
}
