//
//  UseCaseProvider.swift
//  Rockets
//
//  Created by Marco Domingues on 10/06/2021.
//

import Foundation
import RocketsDomain
import RocketsNetwork
import RocketsCoreData

class UseCaseProvider {
    
    open class var rocketsUseCase: RocketsUseCaseInterface {
        return RocketsUseCase(remoteRepository: RocketsRemoteRepository(),
                              storageRepository: RocketsStorageRepository())
    }

}
