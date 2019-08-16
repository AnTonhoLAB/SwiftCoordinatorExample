//
//  DetailViewController.swift
//  SwiftCoordinatorExample
//
//  Created by George Gomes on 15/08/19.
//  Copyright © 2019 George Gomes. All rights reserved.
//

import UIKit
import RxSwift

class DetailViewController: UIViewController {
    
    private let detailView: DetailView = DetailView()
    private let disposeBag = DisposeBag()
    
    private var viewModel: DetailViewModel!
    
    weak var flowDelegate: ListFlowDelegate?
    
    init(with viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func loadView() {
        super.loadView()
        self.view = detailView
        
        viewModel
            .new
            .asObserver()
            .subscribe(onNext: { (new) in
                print("New: sda",new)
            })
            .disposed(by: disposeBag)
    }
}
