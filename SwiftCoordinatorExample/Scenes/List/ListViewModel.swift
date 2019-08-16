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
    let news = ReplaySubject<[New]>.create(bufferSize: 1)
    let netWorkingState = ReplaySubject<NetworkingStatus>.create(bufferSize: 1)
    
    init(_ service: NewsService) {
        self.service = service
    }
    
    private func getNews() {
        self.netWorkingState.onNext(.loading)
        service.getNews { result in
            switch result {
            case .success(let news):
                self.news.onNext(news.news)
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
}

extension ListViewModel: ListObserveActionsDelegate {
    func didTapContinue() {
        // TODO: - "Tap na viewMdel"
    }
    
    
}
