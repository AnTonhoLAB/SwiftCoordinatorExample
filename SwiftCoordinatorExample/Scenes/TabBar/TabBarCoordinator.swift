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
//    private let provider: AppProviderProtocol
       
    weak var delegate: TabBarCoordinatorFlowProtocol?
       
       override func start() {
           let newsCoordinator = NewsCoordinator()
           let newsTabBarItem = UITabBarItem(title: "Inicial", image: #imageLiteral(resourceName: "homeUnselected"), selectedImage: #imageLiteral(resourceName: "homeSelected"))
           newsTabBarItem.tag = 0
           newsCoordinator.rootViewController.tabBarItem = newsTabBarItem

           addChild(coordinator: newsCoordinator)
           newsCoordinator.start()

           let tipsCoordinator = TipsCoordinator()
           let tipsTabBarItem = UITabBarItem(title: "Vídeos", image: #imageLiteral(resourceName: "videosUnselected"), selectedImage: #imageLiteral(resourceName: "videosSelected"))
           tipsTabBarItem.tag = 1
           tipsCoordinator.rootViewController.tabBarItem = tipsTabBarItem

           addChild(coordinator: tipsCoordinator)
           tipsCoordinator.start()

           let productsCoordinator = ProductsCoordinator()
           productsCoordinator.onboardingDelegate = self
           let productsTabBarItem = UITabBarItem(title: "Produtos", image: #imageLiteral(resourceName: "shoppingUnselected"), selectedImage: #imageLiteral(resourceName: "shoppingSelected"))
           productsTabBarItem.tag = 2
           productsCoordinator.rootViewController.tabBarItem = productsTabBarItem

           addChild(coordinator: productsCoordinator)
           productsCoordinator.start()

           let profileCoordinator = ProfileCoordinator(provider: self.provider)
           profileCoordinator.flowDelegate = self
           let profileTabBarItem = UITabBarItem(title: "Perfil", image: #imageLiteral(resourceName: "userUnselected"), selectedImage: #imageLiteral(resourceName: "userSelected"))
           profileTabBarItem.tag = 3
           profileCoordinator.rootViewController.tabBarItem = profileTabBarItem

           addChild(coordinator: profileCoordinator)
           profileCoordinator.start()

           tabBarController.setViewControllers([newsCoordinator.rootViewController,
                                                tipsCoordinator.rootViewController,
                                                productsCoordinator.rootViewController,
                                                profileCoordinator.rootViewController],
                                               animated: true)
       }

       init() {
           tabBarController = UITabBarController()
       }
}
