//
//  wheatherDetailListView.swift
//  assignment1
//
//  Created by Seonwoo Kim on 2023/10/25.
//

import Foundation

import UIKit

class WheatherDetailListView: UIView {
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "STIXTwoText", size: 17)
        return label
    }()
    
    private let weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "STIXTwoText", size: 19)
        return label
    }()
    
    init(time: String, weather: String, temperature: String) {
        super.init(frame: .zero)
        timeLabel.text = "\(time)시"
        setWeatherImage(weather: weather)
        temperatureLabel.text = "\(temperature)"
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        [timeLabel, weatherImageView, temperatureLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            timeLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            weatherImageView.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 15),
            weatherImageView.centerXAnchor.constraint(equalTo: timeLabel.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            temperatureLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            temperatureLabel.centerXAnchor.constraint(equalTo: timeLabel.centerXAnchor)
        ])
    }
    
    private func setWeatherImage(weather: String) {
        switch weather {
        case "cloudBolt":
            weatherImageView.image = UIImage(named: "cloudBolt")
        case "cloudMoon":
            weatherImageView.image = UIImage(named: "cloudMoon")
        case "softRain":
            weatherImageView.image = UIImage(named: "softRain")
        case "heavyRain":
            weatherImageView.image = UIImage(named: "heavyRain")
        case "rainWithSun":
            weatherImageView.image = UIImage(named: "rainWithSun")
        default:
            weatherImageView.image = UIImage(named: "cloudMoon")
        }
    }
}
