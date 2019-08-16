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
    let new = ReplaySubject<New>.create(bufferSize: 1)
    
    init(with new: New) {
        self.new.onNext(new)
        
    }
}
