//
//  TaskPickerCell.swift
//  Get2It
//
//  Created by Vici Shaweddy on 4/3/20.
//  Copyright © 2020 John Kouris. All rights reserved.
//

import UIKit

class TaskPickerCell: UITableViewCell {
    static let reuseIdentifier = "TaskPickerCell"
    
    enum CellType {
        case taskDate
        case startTime
        case endTime
    }
    
    private lazy var mainStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layoutMargins = UIEdgeInsets(top: 12, left: 8, bottom: 12, right: 8)
        view.isLayoutMarginsRelativeArrangement = true
        view.spacing = 8
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layoutMargins = UIEdgeInsets(top: 12, left: 20, bottom: 12, right: 20)
        view.isLayoutMarginsRelativeArrangement = true
        view.spacing = 8
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Medium", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "AvenirNext-Medium", size: 17)
        textField.inputView = self.datePicker
        textField.inputAccessoryView = self.toolbar
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var toolbar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        // Creating flexible space
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        // Creating Done button
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.dismissKeyboard))
        
        // Adding space and button to toolbar
        toolbar.setItems([flexibleSpace,doneButton], animated: false)
        
        return toolbar
    }()
    
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.backgroundColor = .systemBackground
        
        let calendar = Calendar(identifier: .gregorian)
        var comps = DateComponents()
        comps.month = 1
        let maxDate = calendar.date(byAdding: comps, to: Date())
        comps.month = 0
        comps.day = -1
        let minDate = calendar.date(byAdding: comps, to: Date())
        datePicker.maximumDate = maxDate
        datePicker.minimumDate = minDate
        
        return datePicker
    }()
    
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
    
        switch self.cellType {
        case .some(.taskDate):
            dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        case .some(.startTime), .some(.endTime):
            dateFormatter.dateFormat = "h:m a"
        case .none:
            break
        }
        
        return dateFormatter
    }()
    
    private var cellType: CellType?
    private var selectedDate: Date?
    
    var textFieldString: String? {
        return textField.text
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(with title: String, date: Date, cellType: CellType) {
        switch cellType {
        case .taskDate:
            datePicker.datePickerMode = .date
        case .startTime, .endTime:
            datePicker.datePickerMode = .time
        }
        
        selectedDate = date
        self.cellType = cellType
        titleLabel.text = title
        
        // Date -> String using DateFormatter
        textField.text = self.dateFormatter.string(from: date)
    }
    
    @objc func dismissKeyboard() {
        self.textField.endEditing(true)
        
        selectedDate = datePicker.date
        
        let dateString = dateFormatter.string(from: datePicker.date)
        
        // Date -> String using DateFormatter
        self.textField.text = dateString
        
        // TODO: delegate (VC) -> didSelectDate:cellType:
    }
    
    private func setupStackView() {
        contentView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(textField)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
    }
}
