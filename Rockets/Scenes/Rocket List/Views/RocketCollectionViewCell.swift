//
//  RocketCollectionViewCell.swift
//  Rockets
//
//  Created by Marco Domingues on 10/06/2021.
//

import UIKit

class RocketCollectionViewCell: UICollectionViewCell {
    
    private enum Constants {
        static let insets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        static let margins = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    }
    
    // MARK: - Properties
    
    lazy var containerStackView: UIStackView = {
        let sv = UIStackView()
        sv.layoutMargins = Constants.margins
        sv.isLayoutMarginsRelativeArrangement = true
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .center
        sv.spacing = 20
        sv.layoutMargins = Constants.insets
        sv.isLayoutMarginsRelativeArrangement = true
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    lazy var labelsStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 5
        return sv
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = .boldSystemFont(ofSize: 14)
        return lbl
    }()
    
    lazy var firstFlightLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .gray
        lbl.font = .systemFont(ofSize: 14)
        return lbl
    }()
    
    lazy var successRateLabel: PaddedLabel = {
        let lbl = PaddedLabel()
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.font = .boldSystemFont(ofSize: 14)
        lbl.insets = UIEdgeInsets(top: 2, left: 8, bottom: 8, right: 10)
        return lbl
    }()
    
    var model: RocketViewModel? {
        didSet {
            if let viewModel = model {
                bindViewModel(viewModel)
            }
        }
    }
    
    private var sharedConstraints: [NSLayoutConstraint] = []
    private var compactConstraints: [NSLayoutConstraint] = []
    private var regularConstraints: [NSLayoutConstraint] = []
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        containerView.backgroundColor = .white
        
        addSubview(containerStackView)
        containerStackView.addArrangedSubview(containerView)
        containerView.addSubview(stackView)
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(labelsStackView)
        
        labelsStackView.addArrangedSubview(titleLabel)
        labelsStackView.addArrangedSubview(firstFlightLabel)
        
        stackView.addArrangedSubview(UIView())
        stackView.addArrangedSubview(successRateLabel)
        
        setupConstrainsts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    private func setupConstrainsts() {
        sharedConstraints.append(contentsOf: [
            containerStackView.topAnchor.constraint(equalTo: topAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            imageView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        compactConstraints.append(imageView.widthAnchor.constraint(equalToConstant: 60))
        regularConstraints.append(imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5))
        
        NSLayoutConstraint.activate(sharedConstraints)
        layoutForTraitCollection(traitCollection)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setDropShadow()
        imageView.setCornerRadius()
        containerView.setCornerRadius()
        successRateLabel.setCornerRadius()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        layoutForTraitCollection(traitCollection)
    }
    
    private func layoutForTraitCollection(_ traitCollection: UITraitCollection) {
        if (sharedConstraints.first?.isActive == false) {
            NSLayoutConstraint.activate(sharedConstraints)
        }
        
        if traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular {
            if !regularConstraints.isEmpty && regularConstraints.first?.isActive == true {
                NSLayoutConstraint.deactivate(regularConstraints)
            }
            NSLayoutConstraint.activate(compactConstraints)
        } else {
            if !compactConstraints.isEmpty && compactConstraints.first?.isActive == true {
                NSLayoutConstraint.deactivate(compactConstraints)
            }
            NSLayoutConstraint.activate(regularConstraints)
        }
    }
    
    // MARK: - Bindings
    
    private func bindViewModel(_ viewModel: RocketViewModel) {
        titleLabel.text = viewModel.name
        firstFlightLabel.text = viewModel.firstFlightDateString
        successRateLabel.text = viewModel.successRateString
        successRateLabel.backgroundColor = viewModel.badgeColor
        imageView.isHidden = (viewModel.rocketImageURL == nil)
        
        if let url = viewModel.rocketImageURL {
            imageView.loadImage(withURL: url)
        }
    }
    
}
