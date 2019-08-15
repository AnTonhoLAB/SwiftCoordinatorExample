//
//  ListDetailView.swift
//  SwiftCoordinatorExample
//
//  Created by George Gomes on 15/08/19.
//  Copyright © 2019 George Gomes. All rights reserved.
//

import UIKit

class DetailView: UIView {
    private(set) lazy var view: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    weak var actionDelegate: ListObserveActionsDelegate?
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.setupView()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
}

extension DetailView: CodeView {
    func buildViewHierarchy() {
        addSubview(view)
    }
    
    func setupConstraints() {
        view.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        view.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true
        view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .darkGray
    }
}
