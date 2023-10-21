//
//  WheatherListMain.swift
//  assignment1
//
//  Created by Seonwoo Kim on 2023/10/20.
//

import UIKit

final class WheatherListMain: UIView {
    private lazy var moreButton: UIBarButtonItem = {
           var button = UIBarButtonItem()
           button.isHidden = false
           button.image = UIImage(named: "ellipsis_image")
           button.tintColor = .white
           return button
       }()
       
    
    private let scrollView = UIScrollView()
    
    private var contentView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WheatherListMain  {
    private func setStyle(){
        self.backgroundColor = .brown
        moreButton.isHidden = false
        moreButton.image = UIImage(named: "moreIcon")
        moreButton.tintColor = .white
        
        scrollView.alwaysBounceVertical = true
        scrollView.backgroundColor = .red
    }
    private func setLayout() {
        self.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
    }
}
