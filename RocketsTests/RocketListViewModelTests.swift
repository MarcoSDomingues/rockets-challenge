//
//  RocketListViewModelTests.swift
//  RocketsTests
//
//  Created by Marco Domingues on 13/06/2021.
//

import XCTest
@testable import Rockets
@testable import RocketsDomain

class RocketListViewModelTests: XCTestCase {
    
    private var useCase: RocketsMockUseCase!
    private var viewModel: RocketListViewModel!
    
    override func setUpWithError() throws {
        useCase = RocketsMockUseCase()
        viewModel = RocketListViewModel(rocketsUseCase: useCase)
    }
    
    func testRocketListTitle() throws {
        XCTAssertEqual(viewModel.title, "Rockets")
    }
    
    func testFetchRocketsSuccess() throws {
        viewModel.send(event: .onViewIsReady)
        
        XCTAssertTrue(viewModel.state.isLoaded)
        XCTAssertTrue(viewModel.rockets.count == 1)
        XCTAssertEqual(viewModel.rockets[0].name, "Starlink rocket")
    }
    
    func testFetchRocketsError() throws {
        useCase.state = .failure
        
        viewModel.send(event: .onViewIsReady)
        
        let expectedError = RocketsMockUseCase.RocketsMockError.mockError
        
        XCTAssertTrue(viewModel.rockets.isEmpty)
        XCTAssertEqual(viewModel.state.error?.localizedDescription, expectedError.localizedDescription)
    }
    
}

private extension RocketListViewModel.State {
    
    var isLoaded: Bool {
        switch self {
        case .loaded:
            return true
        case .idle, .error, .loading:
            return false
        }
    }
    
    var error: Error? {
        switch self {
        case .error(let error):
            return error
        case .idle, .loaded, .loading:
            return nil
        }
    }
    
}
