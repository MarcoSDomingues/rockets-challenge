//
//  BaseRepository.swift
//  RocketsNetwork
//
//  Created by Marco Domingues on 10/06/2021.
//

import Alamofire
import Foundation

public class BaseRepository {
    
    public init(configuration: RocketsNetwork.Configuration = RocketsNetwork.shared.configuration) {
        SwaggerClientAPI.basePath = configuration.baseUrlString
    }
    
}
