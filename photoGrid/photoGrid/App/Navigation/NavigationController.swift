//
//  NavigationController.swift
//  photoGrid
//
//  Created by Lau on 09/02/2021.
//  Copyright © 2021 Lauriane Haydari. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navBar = self.navigationBar
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
        navBar.tintColor = UIColor.white

    }


}
