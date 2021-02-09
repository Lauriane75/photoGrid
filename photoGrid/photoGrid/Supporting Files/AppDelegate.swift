//
//  AppDelegate.swift
//  photoGrid
//
//  Created by Lauriane Haydari on 03/02/2021.
//  Copyright © 2021 Lauriane Haydari. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let rootViewController = TabBarController(nibName: nil, bundle: nil)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = NavigationController(rootViewController: rootViewController)
        window?.makeKeyAndVisible()

        return true
    }
}
