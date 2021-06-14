//
//  RocketsUseCase.swift
//  Rockets
//
//  Created by Marco Domingues on 10/06/2021.
//

import Combine
import Foundation
import RocketsDomain

class RocketsUseCase: RocketsUseCaseInterface {
    
    private var remoteRepository: RocketsRemoteRepositoryInterface
    
    init(remoteRepository: RocketsRemoteRepositoryInterface) {
        self.remoteRepository = remoteRepository
    }
    
    // MARK: - RocketsUseCaseInterface
    
    func fetchRockets() -> AnyPublisher<[Rocket], Error> {
        remoteRepository.fetchRockets()
    }
    
}
