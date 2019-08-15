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
    
    init(string: String = "") {
        rootViewController = UINavigationController()
    }

    override func start() {
        let splashViewController = ListViewController(with: ListViewModel(NewsService()))
        splashViewController.flowDelegate = self
        self.rootViewController.viewControllers = [splashViewController]
        
    }
}

extension ListCoordinator: ListFlowDelegate {
    func goToNew() {
        let splashViewController = ListViewController(with: ListViewModel(NewsService()))
        splashViewController.flowDelegate = self
        rootViewController.pushViewController(splashViewController, animated: true)
    }
}
