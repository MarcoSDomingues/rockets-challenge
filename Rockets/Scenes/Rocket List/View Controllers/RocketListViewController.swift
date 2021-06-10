//
//  RocketListViewController.swift
//  Rockets
//
//  Created by Marco Domingues on 09/06/2021.
//

import UIKit

class RocketListViewController: UIViewController {
    
    // MARK: - Properties
    
    lazy var collectionView: UICollectionView = {
        return UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    }()
    
    lazy var activityIndicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.color = .black
        view.hidesWhenStopped = true
        return view
    }()
    
    private var viewModel: RocketListViewModel
    private var rockets: [RocketViewModel] = []
    private var cancellables = Set<AnyCancellable>()
    
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
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(collectionView)
        view.addSubview(activityIndicatorView)
        
        bindViewModel()
        setupConstraints()
        setupCollectionView()
        
        viewModel.send(event: .onViewIsReady)
    }
    
    // MARK: - Layout
    
    private func setupConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicatorView.topAnchor.constraint(equalTo: view.topAnchor),
            activityIndicatorView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            activityIndicatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            activityIndicatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    // MARK: - Bindings
    
    private func bindViewModel() {
        viewModel.$state
            .sink { [weak self] state in
                switch state {
                case .idle:
                    break
                case .loaded:
                    self?.hideLoading()
                case .loading:
                    self?.showLoading()
                case .error(let error):
                    self?.hideLoading()
                    self?.showError(error)
                }
            }
            .store(in: &cancellables)
        
        viewModel.$rockets
            .sink { [weak self] rockets in
                self?.rockets = rockets
                self?.collectionView.reloadData()
            }
            .store(in: &cancellables)
        
        viewModel.$title
            .sink { [weak self] title in
                self?.title = title
            }
            .store(in: &cancellables)
    }
    
    // MARK: - UI
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .white
        RocketCollectionViewCell.register(in: collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.alwaysBounceVertical = true
    }
    
    private func showLoading() {
        activityIndicatorView.startAnimating()
    }
    
    private func hideLoading() {
        activityIndicatorView.stopAnimating()
    }
    
    private func showError(_ error: Error) {
        let ac = UIAlertController(title: "Error",
                                   message: error.localizedDescription,
                                   preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default)
        ac.addAction(okAction)
        
        present(ac, animated: true)
    }
    
}

extension RocketListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
    
}

extension RocketListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = RocketCollectionViewCell.dequeue(from: collectionView, for: indexPath)
        cell.model = rockets[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rockets.count
    }
    
}
