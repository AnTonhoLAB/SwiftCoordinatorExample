//
//  NetworkingStatus.swift
//  SwiftCoordinatorExample
//
//  Created by George Gomes on 16/08/19.
//  Copyright © 2019 George Gomes. All rights reserved.
//

import Foundation

enum NetworkingStatus {
    case loading
    case success
    case fail(NetworkingError)
    case `default`
}
