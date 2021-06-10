//
//  RocketListViewModel.swift
//  Rockets
//
//  Created by Marco Domingues on 09/06/2021.
//

import Combine
import Foundation
import RocketsDomain

class RocketListViewModel {
    
    private var rocketsUseCase: RocketsUseCaseInterface
    
    init(rocketsUseCase: RocketsUseCaseInterface = UseCaseProvider.rocketsUseCase) {
        self.rocketsUseCase = rocketsUseCase
    }
    
}
