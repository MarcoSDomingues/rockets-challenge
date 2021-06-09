//
//  RocketsUseCaseInterface.swift
//  RocketsDomain
//
//  Created by Marco Domingues on 09/06/2021.
//

import Combine
import Foundation

public protocol RocketsUseCaseInterface {
    func fetchRockets() -> AnyPublisher<[Rocket], Error>
}
