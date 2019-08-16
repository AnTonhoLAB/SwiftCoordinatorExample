//
//  ListViewController.swift
//  SwiftCoordinatorExample
//
//  Created by George Gomes on 13/08/19.
//  Copyright © 2019 George Gomes. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol ListFlowDelegate: class {
    func goToNew()
}

protocol ViewControllerObserverDelegate: class {
    func startViewController()
}

class ListViewController: UIViewController {
    
    private let listView: ListView = ListView()
    private let disposeBag = DisposeBag()
    private var viewModel: ListViewModel!
    
    weak var flowDelegate: ListFlowDelegate?
    weak var observerDelegate: ViewControllerObserverDelegate?
    
    init(with viewModel: ListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func loadView() {
        super.loadView()
        self.view = listView
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        listView.actionDelegate = viewModel
    
        viewModel
            .news
            .asObserver()
            .bind(to: listView
                .tableView
                .rx
                .items(cellIdentifier: "NewTableViewCell",
                       cellType: NewTableViewCell.self)) {
                        row, new, cell in
                    cell.setup(viewModel: NewCellViewModel(with: new))
        }
        .disposed(by: disposeBag)
        
        viewModel
            .netWorkingState
            .asObserver()
            .bind { (status) in
                print(status)
        }
        .disposed(by: disposeBag)
        
        observerDelegate?.startViewController()
    }
}
