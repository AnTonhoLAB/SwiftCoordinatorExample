//
//  Coordinator.swift
//  SwiftCoordinatorExample
//
//  Created by George Gomes on 12/08/19.
//  Copyright © 2019 George Gomes. All rights reserved.
//

import Foundation

protocol Coordinator: class {
    var childs: [Coordinator] { get set }
    func start()
}

extension Coordinator {
    func addChild(coordinator: Coordinator) {
        childs.append(coordinator)
    }

    func removeChild(coordinator: Coordinator) {
        childs = childs.filter { $0 !== coordinator }
    }
}
