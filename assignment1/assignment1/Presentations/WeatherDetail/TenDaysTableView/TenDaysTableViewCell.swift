//
//  TenDaysTableViewCell.swift
//  assignment1
//
//  Created by Seonwoo Kim on 2023/11/08.
//

import UIKit
import SnapKit
import Then

class TenDaysTableViewCell: UITableViewCell {
    static let identifier: String = "TenDaysTableViewCell"
    
    private let dateLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont(name: "SFProDisplay-Regular", size: 22)
    }
    
    private let weatherImage = UIImageView()
    
    private let minTempLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont(name: "SFProDisplay-Regular", size: 22)
    }
    
    private let degreeBarImage = UIImageView()
    
    private let maxTempLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont(name: "SFProDisplay-Regular", size: 22)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        [dateLabel,weatherImage,minTempLabel,maxTempLabel,degreeBarImage].forEach {
            self.contentView.addSubview($0)
        }
        
        self.setLayout()
    }
    
    private func setLayout() {
        dateLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.top.equalToSuperview().inset(14)
            $0.leading.equalToSuperview().inset(16)
            $0.width.equalTo(45)
        }
        weatherImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.size.equalTo(28)
            $0.leading.equalTo(dateLabel.snp.trailing).offset(30)
            
        }
        minTempLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.top.equalToSuperview().inset(14)
            $0.leading.equalTo(weatherImage.snp.trailing).offset(15)
         }
        degreeBarImage.snp.makeConstraints {
             $0.centerY.equalToSuperview()
             $0.leading.equalTo(minTempLabel.snp.trailing).offset(6)
             $0.width.equalTo(108)
         }
         maxTempLabel.snp.makeConstraints {
             $0.centerY.equalToSuperview()
             $0.top.equalToSuperview().inset(14)
             $0.leading.equalTo(degreeBarImage.snp.trailing).offset(6)
         }
    }
    
    func bindData(data: TenDaysTableViewData) {
            self.weatherImage.image = UIImage(named: data.weatherImage)
            self.dateLabel.text = data.date
            self.minTempLabel.text = data.minTemp
            self.maxTempLabel.text = data.maxTemp
        self.degreeBarImage.image = UIImage(named: data.degreeBar)
    }
}
