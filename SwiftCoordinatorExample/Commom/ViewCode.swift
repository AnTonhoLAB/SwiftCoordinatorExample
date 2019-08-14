//
//  ViewCode.swift
//  SwiftCoordinatorExample
//
//  Created by George Gomes on 14/08/19.
//  Copyright © 2019 George Gomes. All rights reserved.
//

import Foundation

protocol CodeView {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupView()
}

//code template
extension CodeView {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
}
