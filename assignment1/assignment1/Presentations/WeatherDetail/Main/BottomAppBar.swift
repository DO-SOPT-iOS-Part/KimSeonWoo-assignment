//
//  BottomAppBar.swift
//  assignment1
//
//  Created by Seonwoo Kim on 2023/10/25.
//

import Foundation

import UIKit
import SnapKit
import Then

class BottomAppBar: UIView {
    
    //    weak var delegate: BottomAppBarDelegate?
    private let lineView = UIView()
    private let mapButton = UIButton()
    private let pageControl = UIPageControl()
    var listButton = UIButton().then {
        $0.setImage(UIImage(named: "menuIcon"), for: .normal)
        $0.addTarget(BottomAppBar.self, action: #selector(WeatherDetailViewController.listButtonTapped), for: .touchUpInside)
    }
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        
        self.setLayout()
        self.setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        [lineView, mapButton, pageControl, listButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: topAnchor),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 0.3)
        ])
        
        NSLayoutConstraint.activate([
            mapButton.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 13),
            mapButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            pageControl.topAnchor.constraint(equalTo: mapButton.topAnchor),
            pageControl.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            listButton.topAnchor.constraint(equalTo: mapButton.topAnchor),
            listButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        ])
    }
    
    private func setStyle() {
        lineView.do {
            $0.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        }
        mapButton.do{
            $0.setImage(UIImage(named: "mapIcon"), for: .normal)
        }
        pageControl.do {
            $0.currentPage = 0
            $0.numberOfPages = 2
            $0.setIndicatorImage(UIImage(named: "paperAirplaneIcon"), forPage: 0)
        }
        
    }
    
}

extension WeatherDetailViewController {
    @objc func listButtonTapped() {
        // listButton이 눌렸을 때 실행할 코드를 작성
        // 예를 들면 뷰 컨트롤러를 팝하거나 다른 화면으로 이동하는 등의 작업
        print("listButton이 눌렸습니다.")
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.popViewController(animated: true)
    }
}
