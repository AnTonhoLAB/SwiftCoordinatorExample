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
    
//    weak var flowDelegate: GoToOnboardingDelegate?
    
    init(string: String = "") {
        rootViewController = UINavigationController()
    }

    override func start() {
        
        let splashViewController = ProfileViewController()
//        splashViewController.delegate = self
        self.rootViewController.viewControllers = [splashViewController]
//        let profileViewController = ProfileViewController.with(viewModel: viewModel)
//        rootViewController.pushViewController(profileViewController, animated: true)
        
//        if Auth.auth().currentUser != nil {
//            let viewModel = ProfileViewModel(appProviver: provider)
//            viewModel.delegate = self
//            let profileViewController = ProfileViewController.with(viewModel: viewModel)
//            rootViewController.pushViewController(profileViewController, animated: true)
//        } else {
//            let viewModel = ProfileViewModel(appProviver: provider)
//            viewModel.delegate = self
//            let profileViewController = ProfileWithoutUserController.with(viewModel: viewModel)
//            rootViewController.pushViewController(profileViewController, animated: true)
//        }
    }
}
