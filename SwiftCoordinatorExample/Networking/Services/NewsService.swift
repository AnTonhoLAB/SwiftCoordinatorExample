//
//  NewsService.swift
//  SwiftCoordinatorExample
//
//  Created by George Gomes on 14/08/19.
//  Copyright © 2019 George Gomes. All rights reserved.
//

import Foundation

protocol NewsServiceProtocol {
    func getNews(completion: @escaping(Result<News, NetworkingError>) -> Void)
}

class NewsService: NewsServiceProtocol {
    
    let url = "https://www.vagalume.com.br/news/index.js"
    
    func getNews(completion: @escaping (Result<News, NetworkingError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.URLUnwrapFail))
            return
        }
        
        let completionHandler: (Result<News, Error>) -> Void = ResponseBuilder.build(completion: completion)
        URLSession.shared.dataTask(with: url, completion: completionHandler).resume()
    }
    
}
