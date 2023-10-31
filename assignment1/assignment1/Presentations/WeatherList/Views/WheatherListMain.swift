//
//  WheatherListMain.swift
//  assignment1
//
//  Created by Seonwoo Kim on 2023/10/20.
//

import UIKit

final class WheatherListMain: UIView {
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    private var weatherInfoStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setLayout()
        self.setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let seoulWeatherInfoView = CityListView(location: "서울", weather: "흐림", temperature: "25°", maxTemperature: "27°", minTemperature: "23°")
    let seoulWeatherInfoView1 = CityListView(location: "서울", weather: "흐림", temperature: "25°", maxTemperature: "27°", minTemperature: "23°")
    let seoulWeatherInfoView2 = CityListView(location: "서울", weather: "흐림", temperature: "25°", maxTemperature: "27°", minTemperature: "23°")
    let seoulWeatherInfoView3 = CityListView(location: "서울", weather: "흐림", temperature: "25°", maxTemperature: "27°", minTemperature: "23°")
    let seoulWeatherInfoView4 = CityListView(location: "서울", weather: "흐림", temperature: "25°", maxTemperature: "27°", minTemperature: "23°")
    let seoulWeatherInfoView5 = CityListView(location: "서울", weather: "흐림", temperature: "25°", maxTemperature: "27°", minTemperature: "23°")
    let seoulWeatherInfoView6 = CityListView(location: "서울", weather: "흐림", temperature: "25°", maxTemperature: "27°", minTemperature: "23°")
    let seoulWeatherInfoView7 = CityListView(location: "서울", weather: "흐림", temperature: "25°", maxTemperature: "27°", minTemperature: "23°")
    
}

extension WheatherListMain  {
    private func setLayout() {
        self.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
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
        
        
        [seoulWeatherInfoView,seoulWeatherInfoView1,seoulWeatherInfoView2,seoulWeatherInfoView3,seoulWeatherInfoView4,seoulWeatherInfoView5,seoulWeatherInfoView6,seoulWeatherInfoView7].forEach() {
            $0.translatesAutoresizingMaskIntoConstraints = false
            ($0.heightAnchor.constraint(equalToConstant: 120)).isActive = true
            
            weatherInfoStackView.addArrangedSubview($0)
        }
    }
}


