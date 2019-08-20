//
//  ResponseBuilder.swift
//  SwiftCoordinatorExample
//
//  Created by George Gomes on 14/08/19.
//  Copyright © 2019 George Gomes. All rights reserved.
//

import Foundation

final class ResponseBuilder {
    private init() { }
    static func build<T>(completion: @escaping (Result<T, NetworkingError>) -> Void  ) -> (Result<T, Error>) -> Void where T: Decodable {
        return  { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                let networkingError = NetworkingError(error: error)
                completion(.failure(networkingError))
            }
        }
    }
}
