//
//  DetailCoordinator.swift
//  SwiftCoordinatorExample
//
//  Created by George Gomes on 15/08/19.
//  Copyright © 2019 George Gomes. All rights reserved.
//

import UIKit

class DetailCoordinator: BaseCoordinator {
    var rootViewController: UINavigationController!
    var controller: DetailViewController!
    
    weak var flowDelegate: ListFlowDelegate?
    
    init(root: UINavigationController, new: New) {
        let viewModel = DetailViewModel(with: new, service: NewsService())
        controller = DetailViewController(with: viewModel)
        controller.actionDelegate = viewModel
        controller.flowDelegate = flowDelegate
        self.rootViewController = root
    }
    
    override func start() {
        rootViewController.pushViewController(controller, animated: true)
    }
}


