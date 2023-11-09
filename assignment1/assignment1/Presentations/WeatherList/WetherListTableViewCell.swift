//
//  WhetherListTableViewCell.swift
//  assignment1
//
//  Created by Seonwoo Kim on 2023/11/06.
//

import UIKit

class WetherListTableViewCell: UITableViewCell {
    static let identifier: String = "WetherListTableViewCell"
    
    let backgroundImageView = UIImageView().then {
        $0.image = UIImage(named: "listBackground")
        $0.contentMode = .scaleAspectFill
    }
    let myLocationLabel = UILabel().then {
        $0.text = "나의 위치"
        $0.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        $0.textColor = .white
    }
    let locationLabel = UILabel().then {
        $0.font = UIFont(name: "SFProDisplay-Regular", size: 17)
        $0.textColor = .white
    }
    let weatherLabel = UILabel().then {
        $0.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        $0.textColor = .white
    }
    let temperatureLabel = UILabel().then {
        $0.font = UIFont(name: "SFProDisplay-Light", size: 52)
        $0.textColor = .white
    }
    let maxtemperatureLabel = UILabel().then {
        $0.font = UIFont(name: "SFProDisplay-Regular", size: 15)
        $0.textColor = .white
    }
    let mintemperatureLabel = UILabel().then {
        $0.font = UIFont(name: "SFProDisplay-Regular", size: 15)
        $0.textColor = .white
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        self.backgroundColor = .black
        
        self.isUserInteractionEnabled = true
        
        self.contentView.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().offset(-10)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        [myLocationLabel, locationLabel, weatherLabel, temperatureLabel, maxtemperatureLabel, mintemperatureLabel].forEach {
            self.backgroundImageView.addSubview($0)
        }
        myLocationLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(16)
        }
        locationLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(44)
            $0.leading.equalToSuperview().inset(16)
        }
        weatherLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(16)
        }
        temperatureLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(4)
            $0.leading.equalToSuperview().inset(249)
        }
        maxtemperatureLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(196)
        }
        mintemperatureLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(262)
        }
    }
    
    func bindData(data: WeatherListViewData) {
        self.locationLabel.text = data.location
        self.weatherLabel.text = data.weather
        self.temperatureLabel.text = data.temperature
        self.maxtemperatureLabel.text = data.maxTemperature
        self.mintemperatureLabel.text = data.minTemperature
    }
}
