//
//  NewsViewController.swift
//  SwiftCoordinatorExample
//
//  Created by George Gomes on 13/08/19.
//  Copyright © 2019 George Gomes. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol ListFlowDelegate: class {
    func goToNew(with new: New)
}

protocol NewsViewControllerActionDelegate: StartableViewController {
    func select(indexPath: IndexPath)
}

class NewsViewController: UIViewController {
    
    private let listView: NewsView = NewsView()
    private let disposeBag = DisposeBag()
    private var viewModel: ListViewModel!
    
    weak var flowDelegate: ListFlowDelegate?
    weak var actionDelegate: NewsViewControllerActionDelegate?
    
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
            .netWorkingState
            .asObserver()
            .subscribe(onNext: { (status) in
                // TODO: - Setup loading animation
            })
            .disposed(by: disposeBag)
        
        viewModel
            .news
            .asObservable()
            .bind(to: listView
                .tableView
                .rx
                .items(cellIdentifier: "NewTableViewCell",
                       cellType: NewTableViewCell.self)) {
                        row, new, cell in
                    cell.setup(viewModel: NewCellViewModel(with: new))
            }
            .disposed(by: disposeBag)
        
        listView
            .tableView
            .rx
            .itemSelected
            .asObservable()
            .subscribe(onNext: { [weak self] indexPath in
                guard let self = self else { return }
                self.actionDelegate?.select(indexPath: indexPath)
            })
            .disposed(by: disposeBag)

        viewModel
            .selectedNew
            .asObserver()
            .subscribe(onNext: { new in
                self.flowDelegate?.goToNew(with: new)
            })
            .disposed(by: disposeBag)
        
        actionDelegate?.startViewController()
    }
}
