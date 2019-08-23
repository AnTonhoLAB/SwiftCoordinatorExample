//
//  ListView.swift
//  SwiftCoordinatorExample
//
//  Created by George Gomes on 13/08/19.
//  Copyright © 2019 George Gomes. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

protocol ListObserveActionsDelegate: class {
    func didTapContinue()
}

fileprivate enum ConstantSize: CGFloat {
    case addButtonHeigh = 60
}

class NewsView: UIView {
    private var titleLabel: UILabel = UILabel()
    
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

extension NewsView: CodeView {
    func buildViewHierarchy() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .darkGray
        tableView.separatorStyle = .none
    }
}
