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
    
    enum State {
        case idle
        case loaded
        case loading
        case error(Error)
    }
    
    enum Event {
        case onViewIsReady
    }
    
    @Published private(set) var title: String
    @Published private(set) var state: State = .idle
    @Published private(set) var rockets: [RocketViewModel] = []
    
    private var cancellables = Set<AnyCancellable>()
    private var rocketsUseCase: RocketsUseCaseInterface
    private var fetchRocketsTrigger = PassthroughSubject<Void, Never>()
    
    init(rocketsUseCase: RocketsUseCaseInterface = UseCaseProvider.rocketsUseCase) {
        self.title = "Rockets"
        self.rocketsUseCase = rocketsUseCase
        
        fetchRocketsTrigger
            .sink { [weak self] in self?.fetchRockets() }
            .store(in: &cancellables)
    }
    
    private func fetchRockets() {
        state = .loading
        
        rocketsUseCase.fetchRockets()
            .sink { [weak self] completion in
                switch completion {
                case .finished: self?.state = .loaded
                case .failure(let error): self?.state = .error(error)
                }
            } receiveValue: { rockets in
                self.rockets = rockets.map { RocketViewModel(rocket: $0) }
            }
            .store(in: &cancellables)
    }
    
    func send(event: Event) {
        switch event {
        case .onViewIsReady:
            fetchRocketsTrigger.send(())
        }
    }
    
}
