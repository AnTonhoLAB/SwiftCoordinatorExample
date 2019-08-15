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
    
    private enum ConstantSize: CGFloat {
        case addButtonHeigh = 60
    }
    
    lazy var addButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = .red
        button.setTitle("fetch", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapOk), for: .touchUpInside)
        return button
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(NewTableViewCell.self, forCellReuseIdentifier: "NewTableViewCell")
        tableView.estimatedRowHeight = 200
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    weak var actionDelegate: ListObserveActionsDelegate?
    
     override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.setupView()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension ListView: CodeView {
    func buildViewHierarchy() {
        
        addSubview(tableView)
        addSubview(addButton)
    }
    
    func setupConstraints() {
        
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: addButton.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        
        addButton.heightAnchor.constraint(equalToConstant: ConstantSize.addButtonHeigh.rawValue).isActive = true
        addButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        addButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        addButton.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
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
