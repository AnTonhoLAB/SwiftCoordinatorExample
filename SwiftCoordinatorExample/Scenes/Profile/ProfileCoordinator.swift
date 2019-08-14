//
//  ProfileCoordinator.swift
//  SwiftCoordinatorExample
//
//  Created by George Gomes on 12/08/19.
//  Copyright © 2019 George Gomes. All rights reserved.
//

import UIKit

class ProfileCoordinator: BaseCoordinator {
    var rootViewController: UINavigationController
    
    init(string: String = "") {
        rootViewController = UINavigationController()
    }

    override func start() {
        
        let splashViewController = ProfileViewController()
        self.rootViewController.viewControllers = [splashViewController]
    }
}
