//
//  WeatherDetailCollectionViewCell.swift
//  assignment1
//
//  Created by Seonwoo Kim on 2023/11/07.
//

import UIKit
import SnapKit
import Then

class WeatherDetailCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "WeatherDetailCollectionViewCell"
    private var timeLabel = UILabel()
    private var weatherImageView = UIImageView()
    private var temperatureLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        self.addSubview(timeLabel)
        self.addSubview(weatherImageView)
        self.addSubview(temperatureLabel)
        
        timeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(14)
            $0.centerX.equalToSuperview()
        }
        
        weatherImageView.snp.makeConstraints {
            $0.top.equalTo(timeLabel.snp.bottom).offset(14)
            $0.centerX.equalTo(timeLabel)
        }
        
        temperatureLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-10)
            $0.centerX.equalTo(timeLabel)
        }
    }
    
    private func setStyle() {
        timeLabel.do {
            $0.textColor = .white
            $0.font = UIFont(name: "SFProDisplay-Regular", size: 17)
        }
        
        weatherImageView.do {
            $0.contentMode = .scaleAspectFit
            $0.tintColor = .white
        }
        
        temperatureLabel.do {
            $0.textColor = .white
            $0.font = UIFont(name: "SFProDisplay-Regular", size: 22)
        }
        
    }
    
    func bindData(data: WeatherCollectionViewData) {
        self.timeLabel.text = data.time
        setWeatherImage(weather: data.weather)
        self.temperatureLabel.text = String(data.temperature)
    }

    private func setWeatherImage(weather: String) {
        switch weather {
        case "01d":
            weatherImageView.image = UIImage(named: "01d")
        case "01n":
            weatherImageView.image = UIImage(named: "01d")
        case "02d":
            weatherImageView.image = UIImage(named: "02d")
        case "02n":
            weatherImageView.image = UIImage(named: "02d")
        case "03d":
            weatherImageView.image = UIImage(named: "03d")
        case "03n":
            weatherImageView.image = UIImage(named: "03d")
        case "04d":
            weatherImageView.image = UIImage(named: "04d")
        case "04n":
            weatherImageView.image = UIImage(named: "04d")
        case "09d":
            weatherImageView.image = UIImage(named: "09d")
        case "09n":
            weatherImageView.image = UIImage(named: "09d")
        case "10d":
            weatherImageView.image = UIImage(named: "10d")
        case "10n":
            weatherImageView.image = UIImage(named: "10d")
        case "11d":
            weatherImageView.image = UIImage(named: "11d")
        case "11n":
            weatherImageView.image = UIImage(named: "11d")
        case "13d":
            weatherImageView.image = UIImage(named: "13d")
        case "13n":
            weatherImageView.image = UIImage(named: "13d")
        case "50d":
            weatherImageView.image = UIImage(named: "50d")
        case "50n":
            weatherImageView.image = UIImage(named: "50d")
        default:
            weatherImageView.image = UIImage(named: "03d")
        }
    }
    
}
