//
//  ListCoordinator.swift
//  SwiftCoordinatorExample
//
//  Created by George Gomes on 12/08/19.
//  Copyright © 2019 George Gomes. All rights reserved.
//

import UIKit

class ListCoordinator: BaseCoordinator {
    var rootViewController: UINavigationController
    
//    weak var flowDelegate: GoToOnboardingDelegate?
    
    init(string: String = "") {
        rootViewController = UINavigationController()
    }

    override func start() {
        let splashViewController = ListViewController()
        //        splashViewController.delegate = self
        self.rootViewController.viewControllers = [splashViewController]
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
