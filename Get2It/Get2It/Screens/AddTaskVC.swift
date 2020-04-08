//
//  AddTaskVC.swift
//  Get2It
//
//  Created by Vici Shaweddy on 4/1/20.
//  Copyright © 2020 John Kouris. All rights reserved.
//

import UIKit

class AddTaskVC: UIViewController {
    private let tableView = UITableView(frame: .zero, style: .grouped)
    private var nameOfTask: String?
    private var todaysDate = Date()
    private var startTime = Date()
    private var endTime = Date().addingTimeInterval(60 * 60)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Add New Task"
        configureViewController()
        configureTableViewController()
    }
}

extension AddTaskVC {
    private func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        let saveBarButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
        let cancelBarButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissButtonTapped))
        navigationItem.rightBarButtonItem = saveBarButton
        navigationItem.leftBarButtonItem = cancelBarButton
    }
    
    @objc private func saveButtonTapped() {
        
        guard let titleCell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? TaskInfoCell,
            let title = titleCell.title,
            !title.isEmpty,
            let dateCell = tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? TaskPickerCell,
            let startTimeCell = tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as? TaskPickerCell,
            let endTimeCell = tableView.cellForRow(at: IndexPath(row: 3, section: 0)) as? TaskPickerCell else
        {
            let alert = UIAlertController(title: "Missing some fields", message: "Check your information and try again.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        let date = dateCell.textFieldString
        let startTime = startTimeCell.textFieldString
        let endTime = endTimeCell.textFieldString
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func dismissButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    private func configureTableViewController() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TaskInfoCell.self, forCellReuseIdentifier: TaskInfoCell.reuseIdentifier)
        tableView.register(TaskPickerCell.self, forCellReuseIdentifier: TaskPickerCell.reuseIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension AddTaskVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskInfoCell.reuseIdentifier, for: indexPath) as? TaskInfoCell else {
                return UITableViewCell()
            }
            
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskPickerCell.reuseIdentifier, for: indexPath) as? TaskPickerCell else {
                return UITableViewCell()
            }
            cell.configure(with: "Date", date: todaysDate, cellType: .taskDate)
            
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskPickerCell.reuseIdentifier, for: indexPath) as? TaskPickerCell else {
                return UITableViewCell()
            }
            cell.configure(with: "Start Time", date: startTime, cellType: .startTime)
            
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskPickerCell.reuseIdentifier, for: indexPath) as? TaskPickerCell else {
                return UITableViewCell()
            }
            cell.configure(with: "End Time", date: endTime, cellType: .endTime)
            
            return cell
        default:
            return UITableViewCell()
        }
    }
}

extension AddTaskVC: UITableViewDelegate {
    
}
