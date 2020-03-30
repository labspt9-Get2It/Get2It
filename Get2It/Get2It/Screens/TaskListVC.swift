//
//  TaskListVC.swift
//  Get2It
//
//  Created by Vici Shaweddy on 3/29/20.
//  Copyright © 2020 John Kouris. All rights reserved.
//

import UIKit

class TaskListVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureViewController()
    }
    
    private func configureViewController() {
        self.view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let addBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTaskButtonTapped))
        self.navigationItem.rightBarButtonItem = addBarButton
    }
    
    @objc func addTaskButtonTapped() {
        
    }
}
