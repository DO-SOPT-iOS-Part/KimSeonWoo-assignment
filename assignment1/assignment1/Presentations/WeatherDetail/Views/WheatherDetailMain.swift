//
//  WheatherDetailMain.swift
//  assignment1
//
//  Created by Seonwoo Kim on 2023/10/23.
//

import UIKit

class WheatherDetailMain: UIView {
    private let verticalScrollView = UIScrollView()
    private var verticalContentView = UIView()
    private let horizontalScrollView = UIScrollView()
    private var horizontalContentView = UIView()
    private var horizontalStackView = UIStackView()
    private var cityLabel = UILabel()
    private var wheatherStatusLabel = UILabel()
    private var minTempLabel = UILabel()
    private var maxTempLabel = UILabel()
    private var wheatherDescriptionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setLayout()
        self.setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WheatherDetailMain {
    private func setStyle() {}
    private func setLayout() {}
}
