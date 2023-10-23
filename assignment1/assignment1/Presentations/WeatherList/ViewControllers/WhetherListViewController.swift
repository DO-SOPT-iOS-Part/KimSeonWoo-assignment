//
//  ViewController.swift
//  assignment1
//
//  Created by Seonwoo Kim on 2023/10/15.
//

import UIKit

class WheatherListViewController: UIViewController {
    private let homeView = WheatherListMain()
    private let moreButtonItem = UIBarButtonItem()
    private let locationSearchController = UISearchController()

    
        override func viewDidLoad() {
            super.viewDidLoad()
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            setNavigation()
            setSearchController()
        }
        
        override func loadView() {
            self.view = homeView
            setNavigation()
            setSearchController()
        }
        
        deinit {
            print(#function)
        }
}

extension WheatherListViewController {
    private func setSearchController() {
        [locationSearchController].forEach{
            $0.searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "도시 또는 공항 검색", attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.6178889275, green: 0.6178889275, blue: 0.6178889275, alpha: 1)])
            $0.searchBar.searchTextField.backgroundColor = #colorLiteral(red: 0.1353607476, green: 0.1353607476, blue: 0.1353607476, alpha: 1)
            $0.searchBar.searchTextField.textColor = .white
            $0.searchBar.tintColor = .white
            $0.searchBar.setValue("취소", forKey: "cancelButtonText")
            $0.hidesNavigationBarDuringPresentation = true
        }
        
        self.navigationItem.searchController = locationSearchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.locationSearchController.searchBar.searchTextField.textColor = .white
        self.locationSearchController.searchBar.searchTextField.leftView?.tintColor = #colorLiteral(red: 0.6178889275, green: 0.6178889275, blue: 0.6178889275, alpha: 1)
    }
    
    private func setNavigation() {
        [moreButtonItem].forEach {
            $0.isHidden = false
            $0.image = UIImage(named: "moreIcon")
            $0.tintColor = .white
        }
        
        self.view.backgroundColor = .black
        self.navigationItem.rightBarButtonItem = moreButtonItem
        self.navigationItem.title = "날씨"
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        // 스크롤시 작게 보이는 타이틀
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.barTintColor = .black
        // 스크롤 시 보이는 뷰의 백그라운드
        self.navigationController?.navigationBar.prefersLargeTitles = true
        // 라지 사이즈 타이틀이 보이는 것
    }
}


