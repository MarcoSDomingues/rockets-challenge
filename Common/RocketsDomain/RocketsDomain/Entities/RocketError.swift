//
//  RocketError.swift
//  RocketsDomain
//
//  Created by Marco Domingues on 10/06/2021.
//

import Foundation

public enum RocketError: Error {
    case unknown
    case fetchingRockets(String)
}
