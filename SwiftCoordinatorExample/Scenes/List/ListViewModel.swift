//
//  ListViewModel.swift
//  SwiftCoordinatorExample
//
//  Created by George Gomes on 13/08/19.
//  Copyright © 2019 George Gomes. All rights reserved.
//

import Foundation

protocol ListObserveActionsDelegate: class {
    func didTapContinue()
}

class ListViewModel {
   

}

extension ListViewModel: ListObserveActionsDelegate {
    func didTapContinue() {
        print("Tap na viewMdel")
    }
}
