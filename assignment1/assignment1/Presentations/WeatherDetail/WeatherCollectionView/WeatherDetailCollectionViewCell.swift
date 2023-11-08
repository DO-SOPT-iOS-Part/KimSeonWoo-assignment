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
    
    private var timeLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont(name: "SFProDisplay-Regular", size: 17)
    }
    
    private var weatherImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    private var temperatureLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont(name: "SFProDisplay-Regular", size: 19)
    }
    
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
            $0.top.equalToSuperview().offset(4)
            $0.centerX.equalToSuperview()
        }
        
        weatherImageView.snp.makeConstraints {
            $0.top.equalTo(timeLabel.snp.bottom).offset(14)
            $0.centerX.equalTo(timeLabel)
        }
        
        temperatureLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(4)
            $0.centerX.equalTo(timeLabel)
        }
    }
    
    func bindData(data: WeatherCollectionViewData) {
        self.timeLabel.text = data.time
        self.weatherImageView.image = UIImage(named: data.weather)
        self.temperatureLabel.text = data.temperature
    }
    
}
