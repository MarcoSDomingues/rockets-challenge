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
    private var storageRepository: RocketsStorageRepositoryInterface
    
    init(remoteRepository: RocketsRemoteRepositoryInterface, storageRepository: RocketsStorageRepositoryInterface) {
        self.remoteRepository = remoteRepository
        self.storageRepository = storageRepository
    }
    
    // MARK: - RocketsUseCaseInterface
    
    func fetchRockets() -> AnyPublisher<[Rocket], Error> {
        remoteRepository.fetchRockets()
    }
    
}
