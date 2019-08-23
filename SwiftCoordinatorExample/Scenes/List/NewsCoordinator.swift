//
//  NewsCoordinator.swift
//  SwiftCoordinatorExample
//
//  Created by George Gomes on 12/08/19.
//  Copyright © 2019 George Gomes. All rights reserved.
//

import UIKit

class NewsCoordinator: BaseCoordinator {
    var rootViewController: UINavigationController
    var listViewController: NewsViewController
    
    override init() {
        let viewModel = NewsViewModel(NewsService())
        listViewController = NewsViewController(with: viewModel)
        rootViewController = UINavigationController.init(rootViewController: listViewController)
        listViewController.actionDelegate = viewModel
    }

    override func start() {
        listViewController.flowDelegate = self
    }
}

extension NewsCoordinator: NewsFlowDelegate {
    func goToNew(with new: New) {
        let detailCoordinator = DetailCoordinator(root: rootViewController, new: new)
        detailCoordinator.flowDelegate = self
        addChild(coordinator: detailCoordinator)
        detailCoordinator.start()
    }
}
