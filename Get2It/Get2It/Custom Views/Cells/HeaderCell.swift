//
//  HeaderCell.swift
//  Get2It
//
//  Created by John Kouris on 4/3/20.
//  Copyright © 2020 John Kouris. All rights reserved.
//

import UIKit

class HeaderCell: UICollectionViewCell {
    static let reuseIdentifier = "HeaderCell"
    
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
    
    private lazy var iconImage: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor(red: 5/255, green: 91/255, blue: 195/255, alpha: 1)
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var greetingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Medium", size: 17)
        label.textColor = .systemBackground
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
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
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupMainStackView() {
        contentView.addSubview(self.mainStackView)
        mainStackView.addArrangedSubview(iconImage)
        mainStackView.addArrangedSubview(greetingLabel)
        mainStackView.addArrangedSubview(dateLabel)
        
        greetingLabel.text = "Title"
        dateLabel.text = "number"
        
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
