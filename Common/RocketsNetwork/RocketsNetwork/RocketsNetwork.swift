//
//  RocketsNetwork.swift
//  RocketsNetwork
//
//  Created by Marco Domingues on 09/06/2021.
//

import Foundation

public class RocketsNetwork {
    
    public static var shared = RocketsNetwork()
    private(set) public var configuration = Configuration.default
    
    private init() {}
    
    public func configure(with plistPath: String) throws {
        guard let plistData = FileManager.default.contents(atPath: plistPath) else {
            throw ConfigurationError.unknownPath
        }
        let dict = try PropertyListSerialization.propertyList(from: plistData,
                                                              options: .mutableContainersAndLeaves,
                                                              format: nil)
        guard let keyData = dict as? [String: String] else {
            throw ConfigurationError.invalidFormat
        }
        
        let host = try readHost(from: keyData)
        self.configuration = Configuration(host: host)
    }
    
    private func readHost(from dict: [String: String]) throws -> String {
        guard let host = dict["host"] else {
            throw ConfigurationError.missingHost
        }
        return host
    }
    
}

// MARK: - Configuration

extension RocketsNetwork {
    
    public enum ConfigurationError: Error, LocalizedError {
        case unknownPath
        case invalidFormat
        case missingHost
        
        public var errorDescription: String? {
            switch self {
            case .missingHost:
                return "Missing `host` key."
            case .unknownPath:
                return "Could not serialize plist data."
            case .invalidFormat:
                return "Invalid (key, value) format. Expects (String, String)."
            }
        }
    }
    
    public struct Configuration {
        
        public let host: String
        
        internal static var `default` = Configuration()

        private init() {
            self.host = ""
        }
        
        public init(host: String) {
            self.host = host
        }
        
    }
    
}
