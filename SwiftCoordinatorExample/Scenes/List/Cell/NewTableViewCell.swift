//
//  NewTableViewCell.swift
//  SwiftCoordinatorExample
//
//  Created by George Gomes on 14/08/19.
//  Copyright © 2019 George Gomes. All rights reserved.
//

import UIKit

class NewTableViewCell: UITableViewCell {
    
    private var viewModel: NewCellViewModel
    
    private lazy var listView: ListView = {
        let view = ListView()
        view.bounds = self.bounds
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.viewModel = NewCellViewModel()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(listView)
    }
    
    convenience init(viewModel: NewCellViewModel, style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.init(style: style, reuseIdentifier: "NewTableViewCell")
        self.viewModel = viewModel
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
