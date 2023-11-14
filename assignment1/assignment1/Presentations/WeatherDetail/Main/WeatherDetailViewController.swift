//
//  WeatherDetailViewController.swift
//  assignment1
//
//  Created by Seonwoo Kim on 2023/11/07.
//

import UIKit
import SnapKit
import Then

class WeatherDetailViewController: UIViewController {
    
    private let verticalScrollView = UIScrollView().then {
        $0.alwaysBounceVertical = true
        $0.showsVerticalScrollIndicator = false
    }
    
    private let backgroundImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.image = UIImage(named: "background")
    }
    
    private var cityLabel = UILabel().then {
        $0.textColor = .white
        $0.text = "인천광역시"
        $0.font = UIFont(name: "SFProDisplay-Regular", size: 36)
        $0.textAlignment = .center
    }
    
    private var tempLabel = UILabel().then {
        $0.textColor = .white
        $0.text = "21°"
        $0.font = UIFont(name: "SFProDisplay-Regular", size: 102)
        $0.textAlignment = .center
    }
    
    private var wheatherStatusLabel = UILabel().then {
        $0.textColor = .white
        $0.text = "흐림"
        $0.font = UIFont(name: "SFProDisplay-Regular", size: 25)
        $0.textAlignment = .center
    }
    
    private var minTempLabel = UILabel().then {
        $0.textColor = .white
        $0.text = "최저:19°"
        $0.font = UIFont(name: "SFProDisplay-Regular", size: 20)
    }
    
    private var maxTempLabel = UILabel().then {
        $0.textColor = .white
        $0.text = "최고:29°"
        $0.font = UIFont(name: "SFProDisplay-Regular", size: 20)
    }
    
    private let descriptionView = UIView().then {
        $0.backgroundColor = UIColor(red: 0.18, green: 0.20, blue: 0.25, alpha: 0.25)
        $0.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 0.25)
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 10
    }
    
    private var wheatherDescriptionLabel = UILabel().then {
        $0.textColor = .white
        $0.text = "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다."
        $0.font = UIFont(name: "SFProDisplay-Regular", size: 18)
        $0.numberOfLines = 2
    }
    
    private var lineView = UIView().then {
        $0.backgroundColor = UIColor.white.withAlphaComponent(0.3)
    }
    
    private let horizontalCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.backgroundColor = UIColor(red: 0.18, green: 0.20, blue: 0.25, alpha: 0.25)
    }
    
    private var bottomBar = BottomAppBar()
    
    private let tenDaysWeatherView = UIView().then {
        $0.backgroundColor = UIColor(red: 0.18, green: 0.20, blue: 0.25, alpha: 0.25)
        $0.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 0.25)
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 10
    }
    private let tenDaysImage = UIImageView().then {
        $0.image = UIImage(systemName: "calendar")
        $0.tintColor = UIColor(white: 1, alpha: 0.3)
    }
    private let tenDaysWeatherLabel = UILabel().then {
        $0.text = "10일간의 일기예보"
        $0.textColor = .white.withAlphaComponent(0.3)
        $0.font = UIFont(name: "SFProDisplay-Regular", size: 15)
    }
    private let tenDaysWeatherTableView = UITableView(frame: .zero, style: .plain).then {
        $0.backgroundColor = UIColor(red: 0.18, green: 0.20, blue: 0.25, alpha: 0.25)
        $0.isScrollEnabled = false
        $0.separatorStyle = .singleLine
        $0.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        $0.separatorInsetReference = .fromAutomaticInsets
        $0.separatorColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCollectionViewConfig()
        setCollectionViewLayout()
        setTableViewConfig()
        setUpUI()
    }
}


extension WeatherDetailViewController: UICollectionViewDelegate {}
extension WeatherDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherCollectionViewData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherDetailCollectionViewCell.identifier,
                                                            for: indexPath) as? WeatherDetailCollectionViewCell else {return UICollectionViewCell()}
        
        item.bindData(data: weatherCollectionViewData[indexPath.row])
        return item
    }
}

extension WeatherDetailViewController {
    private func setUpUI() {
        
        [backgroundImageView,bottomBar,verticalScrollView].forEach {
            self.view.addSubview($0)
        }
        [tempLabel, cityLabel, wheatherStatusLabel, minTempLabel, maxTempLabel, descriptionView,tenDaysWeatherView].forEach {
            self.verticalScrollView.addSubview($0)
        }
        [wheatherDescriptionLabel, lineView, horizontalCollectionView].forEach {
            self.descriptionView.addSubview($0)
        }
        [tenDaysImage,
         tenDaysWeatherLabel,
         tenDaysWeatherTableView].forEach {
            self.tenDaysWeatherView.addSubview($0)
        }
        
        self.setLayout()
    }
    
    private func setLayout() {
        verticalScrollView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(bottomBar.snp.top)
        }
        bottomBar.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(80)
        }
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        cityLabel.snp.makeConstraints {
            $0.top.equalTo(verticalScrollView.snp.top).offset(50)
            $0.centerX.equalToSuperview()
        }
        tempLabel.snp.makeConstraints {
            $0.top.equalTo(cityLabel.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
        }
        wheatherStatusLabel.snp.makeConstraints {
            $0.top.equalTo(tempLabel.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
        }
        minTempLabel.snp.makeConstraints {
            $0.top.equalTo(wheatherStatusLabel.snp.bottom).offset(3)
            $0.leading.equalTo(tempLabel.snp.leading)
        }
        maxTempLabel.snp.makeConstraints {
            $0.top.equalTo(wheatherStatusLabel.snp.bottom).offset(3)
            $0.trailing.equalTo(tempLabel.snp.trailing)
        }
        descriptionView.snp.makeConstraints {
            $0.top.equalTo(maxTempLabel.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(212)
            $0.width.equalTo(335)
        }
        wheatherDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionView.snp.top).offset(15)
            $0.leading.equalTo(descriptionView.snp.leading).inset(10)
            $0.trailing.equalTo(descriptionView.snp.trailing).inset(10)
        }
        lineView.snp.makeConstraints {
            $0.top.equalTo(wheatherDescriptionLabel.snp.bottom).offset(20)
            $0.leading.equalTo(descriptionView.snp.leading).inset(13)
            $0.trailing.equalTo(descriptionView.snp.trailing).inset(13)
            $0.height.equalTo(0.3)
        }
        horizontalCollectionView.snp.makeConstraints {
            $0.top.equalTo(lineView.snp.bottom)
            $0.bottom.equalTo(descriptionView.snp.bottom)
            $0.leading.equalTo(descriptionView.snp.leading)
            $0.trailing.equalTo(descriptionView.snp.trailing)
        }
        tenDaysWeatherView.snp.makeConstraints {
            $0.top.equalTo(descriptionView.snp.bottom).offset(20)
            $0.bottom.equalToSuperview().inset(86)
            $0.height.equalTo(500)
            $0.width.equalTo(335)
            $0.centerX.equalToSuperview()
        }
        tenDaysImage.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(15)
            $0.top.equalToSuperview().inset(10)
            $0.size.equalTo(18)
        }
        tenDaysWeatherLabel.snp.makeConstraints {
            $0.leading.equalTo(tenDaysImage.snp.trailing).offset(6)
            $0.trailing.equalToSuperview().inset(15)
            $0.top.equalToSuperview().inset(10)
        }
        tenDaysWeatherTableView.snp.makeConstraints {
            $0.top.equalTo(tenDaysWeatherLabel.snp.bottom).offset(6)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setCollectionViewConfig() {
        self.horizontalCollectionView.register(WeatherDetailCollectionViewCell.self,
                                               forCellWithReuseIdentifier: WeatherDetailCollectionViewCell.identifier)
        self.horizontalCollectionView.delegate = self
        self.horizontalCollectionView.dataSource = self
    }
    
    private func setTableViewConfig() {
        self.tenDaysWeatherTableView.register(TenDaysTableViewCell.self,
                                              forCellReuseIdentifier: TenDaysTableViewCell.identifier)
        self.tenDaysWeatherTableView.delegate = self
        self.tenDaysWeatherTableView.dataSource = self
    }
    
    private func setCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 44 , height: 122)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 22
        flowLayout.minimumInteritemSpacing = 3
        self.horizontalCollectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
}

extension WeatherDetailViewController: UITableViewDelegate {}
extension WeatherDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tenDaysTableViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TenDaysTableViewCell.identifier,
                                                       for: indexPath) as? TenDaysTableViewCell else {return UITableViewCell()}
        
        cell.bindData(data: tenDaysTableViewData[indexPath.row])
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell
    }
    
}