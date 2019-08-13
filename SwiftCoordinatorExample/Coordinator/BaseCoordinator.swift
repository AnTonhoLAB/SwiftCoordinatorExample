//
//  BaseCoordinator.swift
//  SwiftCoordinatorExample
//
//  Created by George Gomes on 12/08/19.
//  Copyright © 2019 George Gomes. All rights reserved.
//

import Foundation

class BaseCoordinator: Coordinator {
    var childs: [Coordinator] = []
    var isCompleted: (() -> Void)?

    func start() {
        fatalError("Childrens should implement start function")
    }
}
