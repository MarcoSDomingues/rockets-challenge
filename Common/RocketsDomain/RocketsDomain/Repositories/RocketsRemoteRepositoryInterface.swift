//
//  RocketsRemoteRepositoryInterface.swift
//  RocketsDomain
//
//  Created by Marco Domingues on 09/06/2021.
//

import Combine
import Foundation

public protocol RocketsRemoteRepositoryInterface {
    func fetchRockets() -> AnyPublisher<[Rocket], Error>
}
