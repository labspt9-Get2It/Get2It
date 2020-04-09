//
//  TaskListCell.swift
//  Get2It
//
//  Created by Vici Shaweddy on 4/8/20.
//  Copyright © 2020 John Kouris. All rights reserved.
//

import UIKit

class TaskListCell: UICollectionViewCell {
    static let reuseIdentifier = "TaskListCell"
    let accessoryImageView = UIImageView()
    let seperatorView = UIView()
    
    private lazy var mainStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 8
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel: UILabel = { // Name of the task
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Medium", size: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = { // Time
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "AvenirNext-Medium", size: 15)
        label.textColor = .gray
        return label
    }()
    
    private lazy var circleBar: CircleView = {
        let view = CircleView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        configure()
        setupMainStackView()
        setupCircleBar()
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
    
    private func setupMainStackView() {
        contentView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setupCircleBar() {
        mainStackView.addArrangedSubview(circleBar)
        
        NSLayoutConstraint.activate([
            circleBar.widthAnchor.constraint(equalToConstant: 36)
        ])
    }
    
    private func setupStackView() {
        self.titleLabel.text = "Trying to set up a task"
        self.subtitleLabel.text = "1:00 PM - 2:00 PM"
        
        mainStackView.addArrangedSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
    }
    
}

extension TaskListCell {
    
    
    func configure() {
//        seperatorView.translatesAutoresizingMaskIntoConstraints = false
        seperatorView.backgroundColor = .lightGray
        contentView.addSubview(seperatorView)
        
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.adjustsFontForContentSizeCategory = true
//        label.font = UIFont.preferredFont(forTextStyle: .body)
//        contentView.addSubview(label)
        
        
        accessoryImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(accessoryImageView)
        
        selectedBackgroundView = UIView()
        selectedBackgroundView?.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        
        let rtl = effectiveUserInterfaceLayoutDirection == .rightToLeft
        let chevronImageName = rtl ? "chevron.left" : "chevron.right"
        let chevronImage = UIImage(systemName: chevronImageName)
        accessoryImageView.image = chevronImage
        accessoryImageView.tintColor = UIColor.lightGray.withAlphaComponent(0.7)
        
        let inset = CGFloat(10)
        NSLayoutConstraint.activate([
//            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
//            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
//            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),
//            label.trailingAnchor.constraint(equalTo: accessoryImageView.leadingAnchor, constant: -inset),
            
            accessoryImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            accessoryImageView.widthAnchor.constraint(equalToConstant: 13),
            accessoryImageView.heightAnchor.constraint(equalToConstant: 20),
            accessoryImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            
            seperatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            seperatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            seperatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            seperatorView.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
}

