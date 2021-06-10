//
//  RocketsStorageRepository.swift
//  RocketsCoreData
//
//  Created by Marco Domingues on 10/06/2021.
//

import Combine
import Foundation
import RocketsDomain

public class RocketsStorageRepository: RocketsStorageRepositoryInterface {
    
    public init() {}
    
    // MARK: - RocketsStorageRepositoryInterface
    
    public func saveRockets(_ rockets: [Rocket]) -> AnyPublisher<Void, Error> {
        fatalError("Implement")
    }
    
    public func fetchRockets() -> AnyPublisher<[Rocket], Error> {
        fatalError("Implement")
    }
    
}
