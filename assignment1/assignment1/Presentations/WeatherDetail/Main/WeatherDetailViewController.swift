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
    var cityLabelText: String?
    var tempLabelText: String?
    var wheatherStatusLabelText: String?
    var minMaxTempLabelText: String?
    var iconText: String?
    var descriptionText: String?
    
    
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
        $0.text = "도시"
        $0.font = UIFont(name: "SFProDisplay-Regular", size: 38)
        $0.textAlignment = .center
    }
    
    private var tempLabel = UILabel().then {
        $0.textColor = .white
        $0.text = "온도"
        $0.font = UIFont(name: "SFProDisplay-Regular", size: 102)
        $0.textAlignment = .center
    }
    
    private var wheatherStatusLabel = UILabel().then {
        $0.textColor = .white
        $0.text = "날씨 상태"
        $0.font = UIFont(name: "SFProDisplay-Regular", size: 24)
        $0.textAlignment = .center
    }
    
    private var minMaxTempLabel = UILabel().then {
        $0.textColor = .white
        $0.text = "최저/최고"
        $0.font = UIFont(name: "SFProDisplay-Regular", size: 20)
    }
    
    
    private let descriptionView = UIView().then {
        $0.backgroundColor = UIColor(red: 0.18, green: 0.20, blue: 0.25, alpha: 0.03)
        $0.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 0.25)
        $0.layer.borderWidth = 0.5
        $0.layer.cornerRadius = 10
    }
    
    private var wheatherDescriptionLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont(name: "SFProDisplay-Regular", size: 18)
        $0.numberOfLines = 2
    }
    
    private var lineView = UIView().then {
        $0.backgroundColor = UIColor.white.withAlphaComponent(0.3)
    }
    
    private let horizontalCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.backgroundColor = UIColor(red: 0.18, green: 0.20, blue: 0.25, alpha: 0.03)
    }
    
    private var bottomBar = BottomAppBar()
    
    private let tenDaysWeatherView = UIView().then {
        $0.backgroundColor = UIColor(red: 0.18, green: 0.20, blue: 0.25, alpha: 0.03)
        $0.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 0.25)
        $0.layer.borderWidth = 0.5
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
        $0.backgroundColor = UIColor(red: 0.18, green: 0.20, blue: 0.25, alpha: 0.03)
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
        [tempLabel, cityLabel, wheatherStatusLabel, minMaxTempLabel, descriptionView,tenDaysWeatherView].forEach {
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
        //        가져온 데이터를 라벨에 할당
        cityLabel.text = cityLabelText
        tempLabel.text = tempLabelText
        wheatherStatusLabel.text = wheatherStatusLabelText
        minMaxTempLabel.text = minMaxTempLabelText
        wheatherDescriptionLabel.text = descriptionText
        
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
            $0.top.equalTo(verticalScrollView.snp.top).offset(34)
            $0.centerX.equalToSuperview()
        }
        
        tempLabel.snp.makeConstraints {
            $0.top.equalTo(cityLabel.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        
        wheatherStatusLabel.snp.makeConstraints {
            $0.top.equalTo(tempLabel.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
        }
        
        minMaxTempLabel.snp.makeConstraints {
            $0.top.equalTo(wheatherStatusLabel.snp.bottom).offset(11)
            $0.trailing.equalTo(tempLabel.snp.trailing)
        }
        
        descriptionView.snp.makeConstraints {
            $0.top.equalTo(minMaxTempLabel.snp.bottom).offset(44)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(212)
            $0.width.equalTo(335)
        }
        
        wheatherDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionView.snp.top).offset(10)
            $0.leading.equalTo(descriptionView.snp.leading).inset(15)
            $0.trailing.equalTo(descriptionView.snp.trailing).inset(15)
        }
        
        lineView.snp.makeConstraints {
            $0.top.equalTo(wheatherDescriptionLabel.snp.bottom).offset(11)
            $0.leading.equalTo(descriptionView.snp.leading).inset(14)
            $0.trailing.equalTo(descriptionView.snp.trailing).inset(14)
            $0.height.equalTo(0.3)
        }
        
        horizontalCollectionView.snp.makeConstraints {
            $0.top.equalTo(lineView.snp.bottom)
            $0.bottom.equalTo(descriptionView.snp.bottom)
            $0.leading.equalTo(descriptionView.snp.leading).inset(20)
            $0.trailing.equalTo(descriptionView.snp.trailing).inset(20)
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
