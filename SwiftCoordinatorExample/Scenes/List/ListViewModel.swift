//
//  ListViewModel.swift
//  SwiftCoordinatorExample
//
//  Created by George Gomes on 13/08/19.
//  Copyright © 2019 George Gomes. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol ListObserveActionsDelegate: class {
    func didTapContinue()
}

class ListViewModel {
    private var service: NewsService
    let news = ReplaySubject<[New]>.create(bufferSize: 1)
    
    init(_ service: NewsService) {
        self.service = service
        getNews()
    }
    
    private func getNews() {
        service.getNews { result in
            switch result {
            case .success(let news):
                self.news.onNext(news.news)
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension ListViewModel: ListObserveActionsDelegate {
    func didTapContinue() {
        print("Tap na viewMdel")
    }
}
