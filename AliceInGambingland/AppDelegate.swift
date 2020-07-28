//
//  AppDelegate.swift
//  AliceInGambingland
//
//  Created by Max Khizhniakov on 28.07.2020.
//  Copyright © 2020 Max Khizhniakov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let viewModel = ChooseViewModel()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ChooseViewController(viewModel: viewModel)
        window?.makeKeyAndVisible()
        return true
    }
}

