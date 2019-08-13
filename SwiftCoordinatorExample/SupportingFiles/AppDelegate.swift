//
//  AppDelegate.swift
//  SwiftCoordinatorExample
//
//  Created by George Gomes on 12/08/19.
//  Copyright © 2019 George Gomes. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = window else { fatalError("The window should not be nil!") }
        
        //SplashScreen
        let tab = TabBarCoordinator()
        window.rootViewController = tab.tabBarController
        window.makeKeyAndVisible()
        
        appCoordinator = AppCoordinator(window: window)
        self.appCoordinator.start()
        
        return true
    }
}

