//
//  TabBarControllerViewController.swift
//  photoGrid
//
//  Created by Lau on 09/02/2021.
//  Copyright © 2021 Lauriane Haydari. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    

    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        let firstViewController = HomeViewController()
        
        let tabBarItem1 = UITabBarItem(title: "Home", image: UIImage(systemName: "homekit"), tag: 0)
                
        firstViewController.tabBarItem = tabBarItem1
        
        let tabBarItem2 = UITabBarItem(title: "Saved", image: UIImage(systemName: "square.and.arrow.down"), tag: 0)
        
        let secondViewController = SavedViewController()

        secondViewController.tabBarItem = tabBarItem2

        let tabBarList = [firstViewController, secondViewController]
        
        let tabBar = self.tabBar
        tabBar.barTintColor = UIColor.white
        tabBar.tintColor = UIColor(named: "blue-dark")

        viewControllers = tabBarList
    }

}
