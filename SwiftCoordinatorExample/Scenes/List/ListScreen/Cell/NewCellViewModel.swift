//
//  NewViewModel.swift
//  SwiftCoordinatorExample
//
//  Created by George Gomes on 14/08/19.
//  Copyright © 2019 George Gomes. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class NewCellViewModel {
//    let title = BehaviorRelay<String>(value: "TOTAL")
    let title = ReplaySubject<String>.create(bufferSize: 1)
    let subTitle = ReplaySubject<String>.create(bufferSize: 1)
    let image = ReplaySubject<String>.create(bufferSize: 1)
    
    init(with new: New) {
        title.onNext(new.headline)
        subTitle.onNext(new.kicker)
        image.onNext(new.pic_src)
    }
    
}
