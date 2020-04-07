//
//  SummaryCell.swift
//  Get2It
//
//  Created by Vici Shaweddy on 3/30/20.
//  Copyright © 2020 John Kouris. All rights reserved.
//

import UIKit

class SummaryCell: UICollectionViewCell {
    static let reuseIdentifier = "SummaryCell"
    
    private lazy var mainStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layoutMargins = UIEdgeInsets(top: 12, left: 8, bottom: 12, right: 8)
        view.isLayoutMarginsRelativeArrangement = true
        view.spacing = 8
        view.distribution = .equalSpacing
        return view
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isLayoutMarginsRelativeArrangement = true
        view.spacing = 8
        return view
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isLayoutMarginsRelativeArrangement = true
        view.spacing = 8
        return view
    }()
    
    private lazy var iconImage: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor(red: 5/255, green: 91/255, blue: 195/255, alpha: 1)
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Medium", size: 17)
        label.textColor = .systemBackground
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Medium", size: 24)
        label.textColor = .systemBackground
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupMainStackView()
        setupHorizontalStackView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupMainStackView() {
        contentView.addSubview(self.mainStackView)
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setupHorizontalStackView() {
        mainStackView.addArrangedSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(iconImage)
        horizontalStackView.addArrangedSubview(numberLabel)
        mainStackView.addArrangedSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            iconImage.heightAnchor.constraint(equalToConstant: 40),
            iconImage.widthAnchor.constraint(equalTo: iconImage.heightAnchor)
        ])
        
        // placeholder
        self.titleLabel.text = "Tasks"
        self.numberLabel.text = "3"
    }
}
