//
//  NewCellView.swift
//  SwiftCoordinatorExample
//
//  Created by George Gomes on 14/08/19.
//  Copyright © 2019 George Gomes. All rights reserved.
//

import Foundation

import UIKit

class NewCellView: UIView {
    private lazy var button: UIButton = {
        let button = UIButton(frame: .zero)
        return button
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.setupView()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

}

extension NewCellView: CodeView {
    func buildViewHierarchy() {
        addSubview(button)
    }
    
    func setupConstraints(){
        button.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10).isActive = true
        button.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        button.rightAnchor.constraint(equalTo: rightAnchor, constant: 10).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupAdditionalConfiguration(){
        self.backgroundColor = .purple
    }
}
