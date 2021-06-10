//
//  RocketListViewController.swift
//  Rockets
//
//  Created by Marco Domingues on 09/06/2021.
//

import UIKit

class RocketListViewController: UIViewController {
    
    // MARK: - Properties
    
    private var viewModel: RocketListViewModel
    
    // MARK: - Initialization
    
    init(viewModel: RocketListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        title = "Rockets"
    }
    
}
