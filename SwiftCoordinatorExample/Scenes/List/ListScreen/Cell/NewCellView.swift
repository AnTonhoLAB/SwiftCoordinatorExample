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
    
    private(set) lazy var view: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var title: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Title"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.setupView()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    override func awakeFromNib() {
        super.awakeFromNib()
         self.setupView()
    }
}

extension NewCellView: CodeView {
    func buildViewHierarchy() {
        addSubview(view)
        addSubview(title)
    }
    
    func setupConstraints(){
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        view.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        title.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        
    }
    
    func setupAdditionalConfiguration(){
        self.backgroundColor = .purple
    }
}
