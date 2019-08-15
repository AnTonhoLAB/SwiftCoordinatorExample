//
//  DetailViewController.swift
//  SwiftCoordinatorExample
//
//  Created by George Gomes on 15/08/19.
//  Copyright © 2019 George Gomes. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let detailView: DetailView = DetailView()
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
    }
}