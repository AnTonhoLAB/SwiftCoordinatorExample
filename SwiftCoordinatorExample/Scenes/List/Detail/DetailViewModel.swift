//
//  DetailViewModel.swift
//  SwiftCoordinatorExample
//
//  Created by George Gomes on 15/08/19.
//  Copyright © 2019 George Gomes. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class DetailViewModel {
    private var service: NewsServiceProtocol!
    private var compactNew: New!
    
    let new = ReplaySubject<New>.create(bufferSize: 1)
    let content = ReplaySubject<String>.create(bufferSize: 1)
    
    init(with new: New, service: NewsServiceProtocol) {
        self.service = service
        self.compactNew = new
        self.new.onNext(new)
    }
    
    private func getNewDetail() {
        service.getNew(with:compactNew.url) { result in
            switch result {
            case .success(let response):
                self.content
                    .onNext(
                        self.getHTML(from: response)
                    )
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func getHTML(from string: String) -> String {
        
        var string = string
        
        if let initIndex = string.index(of: "<div class=articleBody>") {
            string.removeSubrange(string.startIndex..<initIndex)
        }
      
        if let endIndex = string.index(of: "<div class=tagLine>") {
            string.removeSubrange(endIndex..<string.endIndex)
        }
        
        return string
    }
}

extension DetailViewModel: StartableViewController {
    func startViewController() {
        getNewDetail()
    }
}

extension StringProtocol {
    func index(of string: Self, options: String.CompareOptions = []) -> Index? {
        return range(of: string, options: options)?.lowerBound
    }
}
