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

fileprivate enum TabBarItem: String {
    case list
    case profile
}

class TabBarCoordinator: BaseCoordinator {
    let tabBarController: UITabBarController
    weak var delegate: TabBarCoordinatorFlowProtocol?
       
    override func start() {
        let listCoordinator = ListCoordinator()
        let listTabBarItem = UITabBarItem(title: TabBarItem.list.rawValue, image:  #imageLiteral(resourceName: "list"), selectedImage: #imageLiteral(resourceName: "list"))
        listTabBarItem.tag = 0
        listCoordinator.rootViewController.tabBarItem = listTabBarItem

        addChild(coordinator: listCoordinator)
        listCoordinator.start()

        let profileCoordinator = ProfileCoordinator()
        let profileTabBarItem = UITabBarItem(title: TabBarItem.profile.rawValue, image: #imageLiteral(resourceName: "profile"), selectedImage: #imageLiteral(resourceName: "profile"))
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
        super.init()
    }
}
