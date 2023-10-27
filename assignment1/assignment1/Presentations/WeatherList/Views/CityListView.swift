import UIKit

class CityListView: UIView {
    
    weak var delegate: WeatherInfoViewDelegate?
    
    let backgroundImageView = UIImageView(image: UIImage(named: "listBackground"))
    let myLocationLabel = UILabel()
    let locationLabel = UILabel()
    let weatherLabel = UILabel()
    let temperatureLabel = UILabel()
    let maxtemperatureLabel = UILabel()
    let mintemperatureLabel = UILabel()
    
    init(location: String, weather: String, temperature: String, maxTemperature: String, minTemperature: String) {
        super.init(frame: .zero)
        locationLabel.text = location
        weatherLabel.text = weather
        temperatureLabel.text = temperature
        maxtemperatureLabel.text = "최고:\(maxTemperature)"
        mintemperatureLabel.text = "최저:\(minTemperature)"
        
        self.setLayout()
        self.setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setLayout(){
        [backgroundImageView, myLocationLabel, locationLabel, weatherLabel, temperatureLabel, maxtemperatureLabel, mintemperatureLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            myLocationLabel.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            myLocationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: myLocationLabel.bottomAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: myLocationLabel.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            weatherLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7),
            weatherLabel.leadingAnchor.constraint(equalTo: myLocationLabel.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            temperatureLabel.topAnchor.constraint(equalTo: myLocationLabel.topAnchor),
            temperatureLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            mintemperatureLabel.bottomAnchor.constraint(equalTo: weatherLabel.bottomAnchor),
            mintemperatureLabel.trailingAnchor.constraint(equalTo: temperatureLabel.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            maxtemperatureLabel.bottomAnchor.constraint(equalTo: weatherLabel.bottomAnchor),
            maxtemperatureLabel.trailingAnchor.constraint(equalTo: mintemperatureLabel.leadingAnchor, constant: -5)
        ])
        
        isUserInteractionEnabled = true
    }
    
    private func setStyle() {
        backgroundImageView.contentMode = .scaleAspectFill
        
        [ myLocationLabel, locationLabel, weatherLabel, temperatureLabel, maxtemperatureLabel, mintemperatureLabel].forEach {
            $0.textColor = .white
        }
        
        myLocationLabel.text = "나의 위치"
        myLocationLabel.font = UIFont(name: "SF-Pro", size: 25)
        
        
//        locationLabel.text = "나의 위치"
        locationLabel.font = UIFont(name: "SF-Pro", size: 25)
    }
    


}
    
