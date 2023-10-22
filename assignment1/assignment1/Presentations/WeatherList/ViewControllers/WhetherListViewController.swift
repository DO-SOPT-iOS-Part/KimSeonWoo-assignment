//
//  ViewController.swift
//  assignment1
//
//  Created by Seonwoo Kim on 2023/10/15.
//

import UIKit

class WheatherListViewController: UIViewController {
    
    private lazy var moreButtonItem = UIBarButtonItem()
    private let locationSearchController = UISearchController()
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    private var weatherInfoStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigation()
        self.setLayout()
        self.setStyle()
        self.setSearchController()
    }
}

extension WheatherListViewController {
    
    private func setLayout() {
        self.view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
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
        
        [weatherInfoStackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            weatherInfoStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7),
            weatherInfoStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            weatherInfoStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            weatherInfoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
    
    private func setStyle() {
        [moreButtonItem].forEach {
            $0.isHidden = false
            $0.image = UIImage(named: "moreIcon")
            $0.tintColor = .white
        }
        
        [locationSearchController].forEach{
            $0.searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "도시 또는 공항 검색", attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.6178889275, green: 0.6178889275, blue: 0.6178889275, alpha: 1)])
            $0.searchBar.searchTextField.backgroundColor = #colorLiteral(red: 0.1353607476, green: 0.1353607476, blue: 0.1353607476, alpha: 1)
            $0.searchBar.searchTextField.textColor = .white
            $0.searchBar.tintColor = .white
            $0.searchBar.setValue("취소", forKey: "cancelButtonText")
            $0.hidesNavigationBarDuringPresentation = true
        }
        
        [scrollView].forEach{
            $0.alwaysBounceVertical = true
        }
        
        [weatherInfoStackView].forEach() {
            $0.axis = .vertical
            $0.distribution = .equalSpacing
            $0.spacing = 20
        }
        
        [weatherInfoStackView].forEach() {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        let seoulWeatherInfoView = CityListView(location: "서울", weather: "흐림", temperature: "25°", maxTemperature: "27°", minTemperature: "23°")
        let seoulWeatherInfoView1 = CityListView(location: "서울", weather: "흐림", temperature: "25°", maxTemperature: "27°", minTemperature: "23°")
        let seoulWeatherInfoView2 = CityListView(location: "서울", weather: "흐림", temperature: "25°", maxTemperature: "27°", minTemperature: "23°")
        let seoulWeatherInfoView3 = CityListView(location: "서울", weather: "흐림", temperature: "25°", maxTemperature: "27°", minTemperature: "23°")
        let seoulWeatherInfoView4 = CityListView(location: "서울", weather: "흐림", temperature: "25°", maxTemperature: "27°", minTemperature: "23°")
        let seoulWeatherInfoView5 = CityListView(location: "서울", weather: "흐림", temperature: "25°", maxTemperature: "27°", minTemperature: "23°")
        let seoulWeatherInfoView6 = CityListView(location: "서울", weather: "흐림", temperature: "25°", maxTemperature: "27°", minTemperature: "23°")
        let seoulWeatherInfoView7 = CityListView(location: "서울", weather: "흐림", temperature: "25°", maxTemperature: "27°", minTemperature: "23°")
        
        [seoulWeatherInfoView,seoulWeatherInfoView1,seoulWeatherInfoView2,seoulWeatherInfoView3,seoulWeatherInfoView4,seoulWeatherInfoView5,seoulWeatherInfoView6,seoulWeatherInfoView7].forEach() {
            $0.translatesAutoresizingMaskIntoConstraints = false
            ($0.heightAnchor.constraint(equalToConstant: 120)).isActive = true
//            $0.delegate = self
            weatherInfoStackView.addArrangedSubview($0)
        }
    }
    
    private func setNavigation() {
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
    
    private func setSearchController() {
        self.navigationItem.searchController = locationSearchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.locationSearchController.searchBar.searchTextField.textColor = .white
        self.locationSearchController.searchBar.searchTextField.leftView?.tintColor = #colorLiteral(red: 0.6178889275, green: 0.6178889275, blue: 0.6178889275, alpha: 1)
    }
    
}


