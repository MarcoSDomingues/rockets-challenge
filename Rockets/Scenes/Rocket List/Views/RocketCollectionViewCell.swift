//
//  RocketCollectionViewCell.swift
//  Rockets
//
//  Created by Marco Domingues on 10/06/2021.
//

import UIKit

class RocketCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .center
        sv.spacing = 20
        sv.isLayoutMarginsRelativeArrangement = true
        sv.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        return sv
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = .systemFont(ofSize: 14)
        return lbl
    }()
    
    var model: RocketViewModel? {
        didSet {
            if let viewModel = model {
                bindViewModel(viewModel)
            }
        }
    }
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .cyan
        
        addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        
        setupConstrainsts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    private func setupConstrainsts() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    // MARK: - Bindings
    
    private func bindViewModel(_ viewModel: RocketViewModel) {
        titleLabel.text = viewModel.name
    }
    
}
