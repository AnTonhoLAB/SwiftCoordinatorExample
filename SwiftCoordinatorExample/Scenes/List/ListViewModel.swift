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


class ListViewModel {
    private var service: NewsService
    let news = BehaviorRelay<[New]>(value: [New]())
    let netWorkingState = ReplaySubject<NetworkingStatus>.create(bufferSize: 1)
    let selectedNew = ReplaySubject<New>.create(bufferSize: 1)
    
    init(_ service: NewsService) {
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

extension ListViewModel: ViewControllerObserverDelegate {
  
    func startViewController() {
        getNews()
    }
    
    func select(indexPath: IndexPath) {
        selectedNew.onNext(news.value[indexPath.row])
    }
}

extension ListViewModel: ListObserveActionsDelegate {
    func didTapContinue() {
        // TODO: - "Tap na viewMdel"
    }
    
    
}
