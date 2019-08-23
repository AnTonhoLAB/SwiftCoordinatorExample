//
//  NewTableViewCell.swift
//  SwiftCoordinatorExample
//
//  Created by George Gomes on 14/08/19.
//  Copyright © 2019 George Gomes. All rights reserved.
//

import UIKit
import RxSwift
import Kingfisher

class NewTableViewCell: UITableViewCell {
    
    private lazy var cellView: NewCellView = {
        let view = NewCellView(frame: .zero)
        return view
    }()

    private var viewModel: NewCellViewModel! {
        didSet {
            setupViewModel()
        }
    }
    
    private let disposeBag = DisposeBag()
    
    // Mark: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(cellView)
        cellView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: 0, height: 0, enableInsets: false)
        selectionStyle = .none
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: - Functions
    func setup(viewModel: NewCellViewModel) {
        self.viewModel = viewModel
    }
    
    
    private func setupViewModel() {
        viewModel
            .title
            .observeOn(MainScheduler.instance)
            .bind(to: self.cellView.title.rx.text)
            .disposed(by: disposeBag)
        
        viewModel
            .subTitle
            .observeOn(MainScheduler.instance)
            .bind(to: self.cellView.subTitle.rx.text)
            .disposed(by: disposeBag)

        viewModel
            .image
            .observeOn(MainScheduler.instance)
            .bind { (baseURL) in
                let vagStrint = "https://www.vagalume.com.br\(baseURL)"
                let url = URL(string: vagStrint)
                self.cellView
                    .pictureImageView
                    .kf
                    .setImage(with:url)
        }
        .disposed(by: disposeBag)

    }
}

extension UIView {
    
    func anchor (top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat, enableInsets: Bool) {
        var topInset = CGFloat(0)
        var bottomInset = CGFloat(0)
        
        if #available(iOS 11, *), enableInsets {
            let insets = self.safeAreaInsets
            topInset = insets.top
            bottomInset = insets.bottom
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop+topInset).isActive = true
        }
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom-bottomInset).isActive = true
        }
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
    }
}

