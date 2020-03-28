//
//  GTTabBarController.swift
//  Get2It
//
//  Created by John Kouris on 3/28/20.
//  Copyright © 2020 John Kouris. All rights reserved.
//

import UIKit

class GTTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().tintColor = .systemBlue
        viewControllers = [createHomeNC()]
    }
    
    func createHomeNC() -> UINavigationController {
        let homeVC = UIViewController()
        homeVC.title = "Home"
        homeVC.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        
        return UINavigationController(rootViewController: homeVC)
    }
    
}
