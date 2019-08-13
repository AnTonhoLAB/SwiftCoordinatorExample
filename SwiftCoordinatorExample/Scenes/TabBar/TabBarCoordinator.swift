//
//  TabBarCoordinator.swift
//  SwiftCoordinatorExample
//
//  Created by George Gomes on 12/08/19.
//  Copyright © 2019 George Gomes. All rights reserved.
//

import Foundation

import UIKit

protocol TabBarCoordinatorFlowProtocol: class {
    func goToOnboarding()
}

class TabBarCoordinator: BaseCoordinator {
    let tabBarController: UITabBarController
       
    weak var delegate: TabBarCoordinatorFlowProtocol?
       
    override func start() {
        let listCoordinator = ListCoordinator()
        let listTabBarItem = UITabBarItem(title: "Inicial", image: #imageLiteral(resourceName: "homeUnselected"), selectedImage: #imageLiteral(resourceName: "homeSelected"))
        listTabBarItem.tag = 0
        listCoordinator.rootViewController.tabBarItem = listTabBarItem

        addChild(coordinator: listCoordinator)
        listCoordinator.start()

        let profileCoordinator = ProfileCoordinator()
        let profileTabBarItem = UITabBarItem(title: "Vídeos", image: #imageLiteral(resourceName: "videosUnselected"), selectedImage: #imageLiteral(resourceName: "videosSelected"))
        profileTabBarItem.tag = 1
        profileCoordinator.rootViewController.tabBarItem = profileTabBarItem

        addChild(coordinator: profileCoordinator)
        profileCoordinator.start()

        tabBarController.setViewControllers([listCoordinator.rootViewController,
                                             profileCoordinator.rootViewController],
                                             animated: true)
       }

    override init() {
           tabBarController = UITabBarController()
       }
}
