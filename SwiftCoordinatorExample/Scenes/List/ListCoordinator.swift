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
    var listViewController: ListViewController
    
    override init() {
        let viewModel = ListViewModel(NewsService())
        listViewController = ListViewController(with: viewModel)
        rootViewController = UINavigationController.init(rootViewController: listViewController)
        listViewController.observerDelegate = viewModel
    }

    override func start() {
        listViewController.flowDelegate = self
    }
}

extension ListCoordinator: ListFlowDelegate {
    func goToNew() {
        let detailCoordinator = DetailCoordinator(root: rootViewController)
        detailCoordinator.flowDelegate = self
        addChild(coordinator: detailCoordinator)
        detailCoordinator.start()
    }
}
