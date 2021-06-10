//
//  RocketsRemoteRepository.swift
//  RocketsNetwork
//
//  Created by Marco Domingues on 10/06/2021.
//

import Combine
import Foundation
import RocketsDomain

public class RocketsRemoteRepository: BaseRepository, RocketsRemoteRepositoryInterface {
    
    // MARK: - RocketsRemoteRepositoryInterface
    
    public func fetchRockets() -> AnyPublisher<[Rocket], Error> {
        return Deferred {
            Future<[Rocket], Error> { promise in
                let request = RocketsAPI.callRocketsWithRequestBuilder()
                
                request.execute {
                    guard let response = $0 else {
                        if let error = $1 {
                            promise(.failure(RocketError.fetchingRockets(error.localizedDescription)))
                        } else {
                            promise(.failure(RocketError.unknown))
                        }
                        return
                    }

                    let rockets = response.body?.asRockets() ?? []
                    promise(.success(rockets))
                }
            }
        }.eraseToAnyPublisher()
    }
    
}
