//
//  AppCoordinator.swift
//  SwiftCoordinatorExample
//
//  Created by George Gomes on 13/08/19.
//  Copyright © 2019 George Gomes. All rights reserved.
//

import UIKit

private enum AppCoordinatorTransition {
    case goToOnboarding
    case goToStore
    case goToAdditionalInfo
}

class AppCoordinator: BaseCoordinator {
    let window: UIWindow
    
    //Coordinators
    var tabCoordinator: TabBarCoordinator!
    
    init(window: UIWindow) {
        self.window = window
        super.init()
    }
    
    override func start() {
        
        tabCoordinator = TabBarCoordinator()
        tabCoordinator.delegate = self
        self.addChild(coordinator: tabCoordinator)
        tabCoordinator.start()
        window.rootViewController = tabCoordinator.tabBarController
        tabCoordinator.isCompleted = { [weak self] in
            guard let weakSelf = self else {
                fatalError("Unable to reference self.")
            }
            weakSelf.removeChild(coordinator: weakSelf.tabCoordinator!)
        }
    }
}

extension AppCoordinator {
    fileprivate func handle(transition: AppCoordinatorTransition) {

    }
}

extension AppCoordinator: TabBarCoordinatorFlowProtocol {
    func goToOnboarding() {
        self.handle(transition: .goToOnboarding)
    }
}
