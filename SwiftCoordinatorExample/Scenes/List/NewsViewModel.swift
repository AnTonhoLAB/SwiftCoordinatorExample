//
//  NewsViewModel.swift
//  SwiftCoordinatorExample
//
//  Created by George Gomes on 13/08/19.
//  Copyright © 2019 George Gomes. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa


class NewsViewModel {
    private var service: NewsServiceProtocol
    let news = BehaviorRelay<[New]>(value: [New]())
    let netWorkingState = ReplaySubject<NetworkingStatus>.create(bufferSize: 1)
    let selectedNew = ReplaySubject<New>.create(bufferSize: 1)
    
    init(_ service: NewsServiceProtocol) {
        self.service = service
    }
    
    private func getNews() {
        self.netWorkingState.onNext(.loading)
        service.getNews { result in
            switch result {
            case .success(let news):
                self.news.accept(news.news)
                self.netWorkingState.onNext(.success)
            case .failure(let error):
                self.netWorkingState.onNext(.fail(NetworkingError(error: error)))
                break
            }
        }
    }
}

extension NewsViewModel: NewsViewControllerActionDelegate {
  
    func startViewController() {
        getNews()
    }
    
    func select(indexPath: IndexPath) {
        selectedNew.onNext(news.value[indexPath.row])
    }
}

extension NewsViewModel: ListObserveActionsDelegate {
    func didTapContinue() {
        // TODO: - "Tap na viewMdel"
    }
    
    
}
