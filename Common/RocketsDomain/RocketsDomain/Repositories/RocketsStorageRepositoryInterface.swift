//
//  RocketsStorageRepositoryInterface.swift
//  RocketsDomain
//
//  Created by Marco Domingues on 09/06/2021.
//

import Combine
import Foundation

public protocol RocketsStorageRepositoryInterface {
    func saveRockets(_ rockets: [Rocket]) -> AnyPublisher<Void, Error>
    func fetchRockets() -> AnyPublisher<[Rocket], Error>
}
