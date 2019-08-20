//
//  NetworkingError.swift
//  SwiftCoordinatorExample
//
//  Created by George Gomes on 14/08/19.
//  Copyright © 2019 George Gomes. All rights reserved.
//

import Foundation

enum NetworkingError: Error {
    case noInternet
    case noData
    case jsonParseFail
    case URLUnwrapFail
    case undefined
    
    init(error: Error){
        if let error = error as? NetworkingError{
            self = error
            return
        }
        
        switch error {
        default:
            self = .undefined
        }
    }
}
