//
//  TabBarView.swift
//  UserPanel
//
//  Created by Shakir Kadirov on 25.02.2024.
//

import UIKit

class TabBarView: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = .systemGray3
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        homeVC.tabBarItem.image = UIImage(systemName: "house")
        homeVC.tabBarItem.title = "Home"
        let settingsVC = UINavigationController(rootViewController: ProfileViewController())
        settingsVC.tabBarItem.image = UIImage(systemName: "gear")
        settingsVC.tabBarItem.title = "Settings"
        self.viewControllers = [homeVC, settingsVC]
    }
}
