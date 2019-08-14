//
//  ListView.swift
//  SwiftCoordinatorExample
//
//  Created by George Gomes on 13/08/19.
//  Copyright © 2019 George Gomes. All rights reserved.
//

import UIKit

class ListView: UIView {
    private var titleLabel: UILabel = UILabel()
    
    lazy var button: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = .red
        button.setTitle("fetch", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapOk), for: .touchUpInside)
        return button
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        return tableView
    }()
    
    weak var actionDelegate: ListObserveActionsDelegate?
    
     override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension ListView: CodeView {
    func buildViewHierarchy() {
        
        addSubview(button)
//        addSubview(tableView)
    }
    
    func setupConstraints() {
        
        
        button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -160).isActive = true
        button.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 160).isActive = true
        

    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .darkGray
    }
}

// MARK: - Actions
extension ListView {
    @objc func didTapOk() {
        guard let actionDelegate = actionDelegate else { return }
        actionDelegate.didTapContinue()
    }
}






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
