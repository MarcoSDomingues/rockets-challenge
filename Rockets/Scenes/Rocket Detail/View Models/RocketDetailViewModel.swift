//
//  RocketDetailViewModel.swift
//  Rockets
//
//  Created by Marco Domingues on 10/06/2021.
//

import Foundation

class RocketDetailViewModel: ObservableObject {
    
    enum Event {
        case onShowWikipedia
    }
    
    @Published var isActive: Bool
    @Published var showsWikipedia: Bool = false
    @Published private(set) var rocket: RocketViewModel
    
    init(rocket: RocketViewModel) {
        self.rocket = rocket
        self.isActive = rocket.isActive
    }
    
    func send(event: Event) {
        switch event {
        case .onShowWikipedia:
            showsWikipedia = true
        }
    }
    
}
