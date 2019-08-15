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
    let title = BehaviorRelay<String>(value: "TOTAL")
    
    init(with new: New) {
        print(new.headline)
        title.accept(new.headline)
    }
    
}
