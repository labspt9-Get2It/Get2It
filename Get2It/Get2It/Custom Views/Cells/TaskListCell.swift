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
//    let seperatorView = UIView()
    
    private lazy var mainStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 8
        return view
    }()
    
    private lazy var innerStackView: UIStackView = {
         let view = UIStackView()
         view.axis = .horizontal
         view.translatesAutoresizingMaskIntoConstraints = false
         view.spacing = 8
        view.alignment = .center
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
    
    private lazy var seperatorView: UIView = {
        let seperator = UIView()
        seperator.translatesAutoresizingMaskIntoConstraints = false
        seperator.backgroundColor = .lightGray
        
        return seperator
    }()
    
    private lazy var chevronImage: UIImageView = {
        let chevron = UIImageView()
        chevron.translatesAutoresizingMaskIntoConstraints = false
        
        return chevron
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupMainStackView()
        setupInnerStackView()
        setupCircleBar()
        setupStackView()
        setupSeperatorView()
        setupChevronImage()
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
    
    private func setupInnerStackView() {
        mainStackView.addArrangedSubview(innerStackView)
    }

    private func setupCircleBar() {
        innerStackView.addArrangedSubview(circleBar)
    }
    
    private func setupStackView() {
        self.titleLabel.text = "Trying to set up a task"
        self.subtitleLabel.text = "1:00 PM - 2:00 PM"
        
        innerStackView.addArrangedSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
    }
    
    private func setupSeperatorView() {
        mainStackView.addArrangedSubview(seperatorView)
        
        NSLayoutConstraint.activate([
            seperatorView.heightAnchor.constraint(equalToConstant: 0.5),
            seperatorView.widthAnchor.constraint(equalTo: mainStackView.widthAnchor)
        ])
    }
    
    private func setupChevronImage() {
        innerStackView.addArrangedSubview(self.chevronImage)
        
        let rtl = effectiveUserInterfaceLayoutDirection == .rightToLeft
        let chevronImageName = rtl ? "chevron.left" : "chevron.right"
        let chevronImage = UIImage(systemName: chevronImageName)
        self.chevronImage.image = chevronImage
        self.chevronImage.tintColor = UIColor.lightGray.withAlphaComponent(0.7)

        NSLayoutConstraint.activate([
            self.chevronImage.widthAnchor.constraint(equalToConstant: 13)
        ])
    }
}
