import UIKit

class WheatherDetailMain: UIView {
    private let verticalScrollView = UIScrollView()
    private var verticalContentView = UIView()
    private let horizontalScrollView = UIScrollView()
    private var cityLabel = UILabel()
    private var tempLabel = UILabel()
    private var wheatherStatusLabel = UILabel()
    private var minTempLabel = UILabel()
    private var maxTempLabel = UILabel()
    private var wheatherDescriptionLabel = UILabel()
    private var horizontalWeatherStackView = UIStackView()
    private var lineView = UIView()
    private let descriptionView = UIStackView()
    var bottomBar = BottomAppBar()
    private let backgroundImageView = UIImageView(image: UIImage(named: "background"))
    
    
    let timelyWeatherInfoView1 = WheatherDetailListView(time: "1", weather: "cloudBolt", temperature: "25°")
    let timelyWeatherInfoView2 = WheatherDetailListView(time: "2", weather: "softRain", temperature: "24°")
    let timelyWeatherInfoView3 = WheatherDetailListView(time: "3", weather: "cloudBolt", temperature: "23°")
    let timelyWeatherInfoView4 = WheatherDetailListView(time: "4", weather: "softRain", temperature: "22°")
    let timelyWeatherInfoView5 = WheatherDetailListView(time: "5", weather: "softRain", temperature: "21°")
    let timelyWeatherInfoView6 = WheatherDetailListView(time: "6", weather: "cloudBolt", temperature: "20°")
    let timelyWeatherInfoView7 = WheatherDetailListView(time: "7", weather: "cloudBolt", temperature: "20°")
    let timelyWeatherInfoView8 = WheatherDetailListView(time: "8", weather: "softRain", temperature: "21°")
    let timelyWeatherInfoView9 = WheatherDetailListView(time: "9", weather: "cloudBolt", temperature: "22°")
    let timelyWeatherInfoView10 = WheatherDetailListView(time: "10", weather: "softRain", temperature: "23°")
    let timelyWeatherInfoView11 = WheatherDetailListView(time: "11", weather: "cloudBolt", temperature: "24°")
    let timelyWeatherInfoView12 = WheatherDetailListView(time: "12", weather: "cloudBolt", temperature: "25°")
    
    let totalWidth = CGFloat(70 * 12)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setLayout()
        self.setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WheatherDetailMain {
    
    private func setStyle() {
        
        [verticalScrollView].forEach {
            $0.alwaysBounceVertical = true
            $0.showsVerticalScrollIndicator = false
        }
        
        [horizontalWeatherStackView].forEach{
            $0.axis = .horizontal
            $0.distribution = .equalSpacing
            $0.spacing = 10
        }
        
        [horizontalScrollView].forEach {
            $0.showsHorizontalScrollIndicator = false
        }
        
        [cityLabel].forEach {
            $0.textColor = .white
            $0.text = "의정부시"
            $0.font = UIFont(name: "SFProDisplay-Regular", size: 36)
        }
        
        [tempLabel].forEach {
            $0.textColor = .white
            $0.text = "21°"
            $0.font = UIFont(name: "SFProDisplay-Regular", size: 102)
        }
        
        [wheatherStatusLabel].forEach {
            $0.textColor = .white
            $0.text = "흐림"
            $0.font = UIFont(name: "SFProDisplay-Regular", size: 25)
        }
        
        [minTempLabel].forEach {
            $0.textColor = .white
            $0.text = "최저:19°"
            $0.font = UIFont(name: "SFProDisplay-Regular", size: 23)
        }
        
        [maxTempLabel].forEach {
            $0.textColor = .white
            $0.text = "최고:29°"
            $0.font = UIFont(name: "SFProDisplay-Regular", size: 23)
        }
        
        [wheatherDescriptionLabel].forEach {
            $0.textColor = .white
            $0.text = "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다."
            $0.font = UIFont(name: "SFProDisplay-Regular", size: 18)
            $0.numberOfLines = 2
        }
        
        [descriptionView].forEach {
            $0.backgroundColor = UIColor.black.withAlphaComponent(0.1)
            $0.axis = .vertical
            $0.alignment = .center
            $0.layer.cornerRadius = 20
            $0.layer.borderColor = UIColor.white.withAlphaComponent(0.3).cgColor
            $0.layer.borderWidth = 0.5
        }
        [lineView].forEach{
            $0.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        }
        
        [timelyWeatherInfoView1, timelyWeatherInfoView2, timelyWeatherInfoView3, timelyWeatherInfoView4, timelyWeatherInfoView5, timelyWeatherInfoView6, timelyWeatherInfoView7,timelyWeatherInfoView8, timelyWeatherInfoView9, timelyWeatherInfoView10, timelyWeatherInfoView11, timelyWeatherInfoView12].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            ($0.widthAnchor.constraint(equalToConstant: 65)).isActive = true
            ($0.heightAnchor.constraint(equalToConstant: 150)).isActive = true
            horizontalWeatherStackView.addArrangedSubview($0)
        }
        
    }
    
    private func setLayout() {
        [verticalScrollView, bottomBar].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
        
        verticalScrollView.addSubview(verticalContentView)
        verticalContentView.translatesAutoresizingMaskIntoConstraints = false
        
        verticalContentView.addSubview(cityLabel)
        verticalContentView.addSubview(tempLabel)
        verticalContentView.addSubview(wheatherStatusLabel)
        verticalContentView.addSubview(minTempLabel)
        verticalContentView.addSubview(maxTempLabel)
        verticalContentView.addSubview(descriptionView)
        
        [cityLabel,tempLabel,wheatherStatusLabel,minTempLabel,maxTempLabel,descriptionView,horizontalScrollView,wheatherDescriptionLabel,horizontalWeatherStackView,lineView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        descriptionView.addArrangedSubview(wheatherDescriptionLabel)
        descriptionView.addArrangedSubview(lineView)
        descriptionView.addArrangedSubview(horizontalScrollView)
        
        horizontalScrollView.addSubview(horizontalWeatherStackView)
        
        // verticalScrollView 제약 조건 설정
        NSLayoutConstraint.activate([
            verticalScrollView.topAnchor.constraint(equalTo: self.topAnchor),
            verticalScrollView.bottomAnchor.constraint(equalTo: bottomBar.topAnchor),
            verticalScrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            verticalScrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            verticalContentView.topAnchor.constraint(equalTo: verticalScrollView.contentLayoutGuide.topAnchor),
            verticalContentView.bottomAnchor.constraint(equalTo: verticalScrollView.contentLayoutGuide.bottomAnchor),
            verticalContentView.leadingAnchor.constraint(equalTo: verticalScrollView.contentLayoutGuide.leadingAnchor),
            verticalContentView.trailingAnchor.constraint(equalTo: verticalScrollView.contentLayoutGuide.trailingAnchor),
        ])
        
        verticalContentView.widthAnchor.constraint(equalTo: verticalScrollView.widthAnchor).isActive = true
        let contentViewHeight = verticalContentView.heightAnchor.constraint(greaterThanOrEqualTo: self.heightAnchor)
        contentViewHeight.priority = .defaultLow
        contentViewHeight.isActive = true
        
        // bottomBar 제약 조건 설정
        NSLayoutConstraint.activate([
            bottomBar.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            bottomBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bottomBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bottomBar.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        // cityLabel, tempLabel, wheatherStatusLabel, minTempLabel, maxTempLabel, descriptionView 제약 조건 설정
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: verticalContentView.topAnchor, constant: 50),
            cityLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            tempLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 5),
            tempLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            wheatherStatusLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 5),
            wheatherStatusLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            maxTempLabel.topAnchor.constraint(equalTo: wheatherStatusLabel.bottomAnchor, constant: 3),
            maxTempLabel.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: -3)
        ])
        
        NSLayoutConstraint.activate([
            minTempLabel.topAnchor.constraint(equalTo: wheatherStatusLabel.bottomAnchor, constant: 3),
            minTempLabel.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: 3)
        ])
        
        NSLayoutConstraint.activate([
            descriptionView.topAnchor.constraint(equalTo: maxTempLabel.bottomAnchor, constant: 50),
            descriptionView.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionView.heightAnchor.constraint(equalToConstant: 212),
            descriptionView.widthAnchor.constraint(equalToConstant: 345)
                ])
        
        // wheatherDescriptionLabel, lineView 제약 조건 설정
        NSLayoutConstraint.activate([
            wheatherDescriptionLabel.topAnchor.constraint(equalTo: descriptionView.topAnchor, constant: 15),
            wheatherDescriptionLabel.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor, constant: 13),
            wheatherDescriptionLabel.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor, constant: -13),
            wheatherDescriptionLabel.bottomAnchor.constraint(equalTo: lineView.topAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: wheatherDescriptionLabel.bottomAnchor, constant: 20),
            lineView.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor, constant: 13),
            lineView.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor, constant: -13),
            lineView.heightAnchor.constraint(equalToConstant: 0.3)
        ])
        
        // horizontalScrollView 제약 조건 설정
        NSLayoutConstraint.activate([
            horizontalScrollView.topAnchor.constraint(equalTo: lineView.bottomAnchor),
            horizontalScrollView.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor),
            horizontalScrollView.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor),
            horizontalScrollView.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            horizontalWeatherStackView.topAnchor.constraint(equalTo: horizontalScrollView.topAnchor),
            horizontalWeatherStackView.leadingAnchor.constraint(equalTo: horizontalScrollView.leadingAnchor),
            horizontalWeatherStackView.trailingAnchor.constraint(equalTo: horizontalScrollView.trailingAnchor)

        ])
        

    }
}

// 가로 스크롤 수정하기
