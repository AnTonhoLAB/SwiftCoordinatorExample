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
    
    lazy var pictureImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = #imageLiteral(resourceName: "placeholderImage")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    lazy var title: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Title"
        label.font = label.font.withSize(16)
        label.textColor = #colorLiteral(red: 0.2784313725, green: 0.2784313725, blue: 0.2784313725, alpha: 1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    lazy var subTitleBackground: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5463798416)
        view.clipsToBounds = true
        return view
    }()
    
    lazy var subTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Subtitle"
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.font = label.font.withSize(14)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    lazy var stack: UIStackView = {
        let view = UIStackView(frame: .zero)
        return view
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
        clipsToBounds = true
        addSubview(title)
        addSubview(pictureImageView)
        pictureImageView.addSubview(subTitleBackground)
        subTitleBackground.addSubview(subTitle)
    }
    
    func setupConstraints(){
        
        title.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        
        pictureImageView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8).isActive = true
        pictureImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        pictureImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        pictureImageView.heightAnchor.constraint(equalTo: pictureImageView.widthAnchor, multiplier: 0.5).isActive = true
        pictureImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        subTitleBackground.bottomAnchor.constraint(equalTo: pictureImageView.bottomAnchor, constant: 0).isActive = true
        subTitleBackground.leadingAnchor.constraint(equalTo: pictureImageView.leadingAnchor, constant: 0).isActive = true
        subTitleBackground.trailingAnchor.constraint(equalTo: pictureImageView.trailingAnchor, constant: 0).isActive = true

        subTitle.topAnchor.constraint(equalTo: subTitleBackground.topAnchor, constant: 5).isActive = true
        subTitle.bottomAnchor.constraint(equalTo: subTitleBackground.bottomAnchor, constant: -5).isActive = true
        subTitle.leadingAnchor.constraint(equalTo: subTitleBackground.leadingAnchor, constant: 5).isActive = true
        subTitle.trailingAnchor.constraint(equalTo: subTitleBackground.trailingAnchor, constant: -5).isActive = true
    }
    
    func setupAdditionalConfiguration(){
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.layer.cornerRadius = 8
    }
}
