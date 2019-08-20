//
//  URLSessionExtension.swift
//  SwiftCoordinatorExample
//
//  Created by George Gomes on 14/08/19.
//  Copyright © 2019 George Gomes. All rights reserved.
//

import Foundation

extension URLSession {
    // This function make a request and complete with the expected type in a `Result`
    func dataTask<T>(with url: URL, completion: @escaping (Result<T, Error>) -> Void) -> URLSessionDataTask where T: Decodable {
        return dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkingError.noData))
                return
            }
            
            do {
                let myNewObject = try Decode.decodeObject(type: T.self, from: data)
                completion(.success(myNewObject))
            } catch {
                completion(.failure(NetworkingError.jsonParseFail))
            }
        }
    }
    
    // This function make a request and complete with the String in a `Result`
    func dataTaskString(with url: URL, completion: @escaping (Result<String, Error>) -> Void) -> URLSessionDataTask {
        return dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                let error = NSError(domain: "error", code: 0, userInfo: nil)
                completion(.failure(error))
                return
            }
            let string = String(decoding: data, as: UTF8.self)
            completion(.success(string))
        }
    }
}
