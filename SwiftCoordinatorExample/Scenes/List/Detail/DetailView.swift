//
//  ListDetailView.swift
//  SwiftCoordinatorExample
//
//  Created by George Gomes on 15/08/19.
//  Copyright © 2019 George Gomes. All rights reserved.
//

import UIKit
import WebKit

class DetailView: UIView {
//    private(set) lazy var view: UIView = {
//        let view = UIView(frame: .zero)
//        view.backgroundColor = .yellow
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    
    lazy var webView: WKWebView = {
        let view = WKWebView(frame: .zero)
        
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
        addSubview(webView)
    }
    
    func setupConstraints() {
        webView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        webView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .darkGray
    }
}
