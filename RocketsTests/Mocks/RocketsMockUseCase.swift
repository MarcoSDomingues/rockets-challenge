//
//  RocketsMockUseCase.swift
//  RocketsTests
//
//  Created by Marco Domingues on 13/06/2021.
//

import Combine
import Foundation
@testable import RocketsDomain

class RocketsMockUseCase: RocketsUseCaseInterface {
    
    enum State {
        case success
        case failure
    }
    
    var state: State = .success
    
    private let rockets: [Rocket] = [
        Rocket(name: "Starlink rocket",
               country: "Portugal",
               description: "description",
               isActive: true,
               cost: 3_000_000,
               firstFlightDate: Date(),
               successRatePercentage: 80,
               rocketImageURL: nil,
               wikipediaURL: nil)
    ]
    
    func fetchRockets() -> AnyPublisher<[Rocket], Error> {
        return Deferred {
            Future<[Rocket], Error> { promise in
                switch self.state {
                case .success:
                    promise(.success(self.rockets))
                case .failure:
                    promise(.failure(RocketsMockError.mockError))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    enum RocketsMockError: Error {
        case mockError
    }

}
