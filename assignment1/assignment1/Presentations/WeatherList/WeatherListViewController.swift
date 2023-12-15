//
//  WheatherListViewController.swift
//  assignment1
//
//  Created by Seonwoo Kim on 2023/11/06.
//

import UIKit
import SnapKit
import Then

class WeatherListViewController: UIViewController {
    var weatherListViewData: [WeatherListViewData?] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    let locationArray: [String] = ["gongju", "gwangju", "gunsan", "daegu", "daejeon"]
    var filteredLocationData = [WeatherListViewData]()
    private let moreButtonItem = UIBarButtonItem()
    private let locationSearchController = UISearchController()
    
    private let tableView = UITableView(frame: .zero, style: .plain).then {
        $0.backgroundColor = .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSearchController()
        setNavigation()
        setTableViewConfig()
        setLayout()
        setCurrentWeatherData()
    }
    
    private func reload() {
        self.tableView.reloadData()
    }
    
    private func setLayout() {
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setTableViewConfig() {
        self.tableView.register(WetherListTableViewCell.self,
                                forCellReuseIdentifier: WetherListTableViewCell.identifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    private func setSearchController() {
        let locationSearchController = UISearchController().then {
            $0.searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "도시 또는 공항 검색", attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.6178889275, green: 0.6178889275, blue: 0.6178889275, alpha: 1)])
            $0.searchBar.searchTextField.backgroundColor = #colorLiteral(red: 0.1353607476, green: 0.1353607476, blue: 0.1353607476, alpha: 1)
            $0.searchBar.searchTextField.textColor = .white
            $0.searchBar.tintColor = .white
            $0.searchBar.setValue("취소", forKey: "cancelButtonText")
            $0.hidesNavigationBarDuringPresentation = true
            let textFieldInsideSearchBar = navigationItem.searchController?.searchBar.value(forKey: "searchField") as? UITextField
        }
        
        self.navigationItem.searchController = locationSearchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.locationSearchController.searchBar.searchTextField.textColor = .white
        self.locationSearchController.searchBar.searchTextField.leftView?.tintColor = #colorLiteral(red: 0.6178889275, green: 0.6178889275, blue: 0.6178889275, alpha: 1)
        navigationItem.searchController?.searchResultsUpdater = self
    }
    
    private func setNavigation() {
        let moreButtonItem = UIBarButtonItem().then {
            $0.isHidden = false
            $0.image = UIImage(named: "moreIcon")
            $0.tintColor = .white
        }
        
        self.view.backgroundColor = .black
        self.navigationItem.rightBarButtonItem = moreButtonItem
        self.navigationItem.title = "날씨"
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        // 스크롤시 작게 보이는 타이틀
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.barTintColor = .black
        // 스크롤 시 보이는 뷰의 백그라운드
        self.navigationController?.navigationBar.prefersLargeTitles = true
        // 라지 사이즈 타이틀이 보이는 것
    }
    
    private func translateCityNameToKorean(name: String) -> String {
        let translations: [String: String] = [
            "Gongju": "공주",
            "Gwangju": "광주",
            "Gunsan": "군산",
            "Daegu": "대구",
            "Daejeon": "대전"
        ]
        return translations[name] ?? name
    }
    
    // 날씨 최초 리스트뷰 데이터 Api 관련 부분
    private func setCurrentWeatherData() {
        for city in locationArray {
            getCurrentWeather(cityName: city) {
                
            }
        }
            self.reload()

    }
    
    @objc func tapListView(_ sender: UITapGestureRecognizer) {
        if let indexPath = tableView.indexPathForRow(at: sender.location(in: tableView)) {
            // 터치한 셀의 indexPath를 확인하고 데이터에 접근
            let tappedCellData = isFiltering ? filteredLocationData[indexPath.row] : weatherListViewData[indexPath.row]
            //WeatherDetailViewController 라벨 데이터를 전달
            let weatherDetailViewController = WeatherDetailViewController()
            weatherDetailViewController.cityLabelText = tappedCellData?.location
            weatherDetailViewController.tempLabelText = "\(String(describing: tappedCellData?.temperature))°"
            weatherDetailViewController.wheatherStatusLabelText = tappedCellData?.weather
            weatherDetailViewController.minMaxTempLabelText = "최저:\(String(describing: tappedCellData?.minTemperature))°  최고:\(String(describing: tappedCellData?.maxTemperature))°"
            
            // 푸시가 데이터가 바뀐 이후의 코드를 맨 마지막으로 이동
            Task {
                do {
                    getHourlyWeather(lat: Int(tappedCellData?.lat ?? 0), lon: Int(tappedCellData?.lon ?? 0) )
                    
                    self.navigationController?.pushViewController(weatherDetailViewController, animated: true)
                    self.navigationController?.isNavigationBarHidden = true
                } catch {
                    print(error)
                }
            }
        }
    }
}

extension WeatherListViewController: UITableViewDelegate {}
extension WeatherListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltering ? filteredLocationData.count : weatherListViewData.count
        //        navigationController?.pushViewController(pageController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WetherListTableViewCell.identifier, for: indexPath) as? WetherListTableViewCell else { return UITableViewCell() }
        
        let dataToDisplay = self.isFiltering ? filteredLocationData[indexPath.row] : weatherListViewData[indexPath.row]
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapListView))
        cell.addGestureRecognizer(tapGesture)
        // 선택 되었을 때 배경색이 바뀌는 것을 방지하기 위한 코드
        let background = UIView()
        background.backgroundColor = .clear
        cell.selectedBackgroundView = background
        cell.weatherListViewData = dataToDisplay
        return cell
    }
}

extension WeatherListViewController: UISearchResultsUpdating {
    var isFiltering: Bool {
        let searchController = self.navigationItem.searchController
        let isActive = searchController?.isActive ?? false
        let isSearchBarHasText = searchController?.searchBar.text?.isEmpty == false
        
        return isActive && isSearchBarHasText
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        filteredLocationData = weatherListViewData.compactMap { $0 }
            .filter { data in
                return data.location.lowercased().contains(text.lowercased())
        }

        self.tableView.reloadData()
    }
}

// 네트워크

extension WeatherListViewController {
    func getCurrentWeather(cityName: String, completion: @escaping () -> Void) {
        CurrentAPI.shared.getCurrentWeather(cityName: cityName) { (response) in
            switch response {
            case .success(let data):
                print("success 🚨", data)
                if let data = data as? WeatherListViewData {
                    self.weatherListViewData.append(data)
                    print("🚨\(self.weatherListViewData)")
                }
            case .requestErr(let statusCode):
                print("requestErr", statusCode)
            case .pathErr:
                print(".pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }

    func getHourlyWeather(lat: Int, lon: Int) {
//        CurrentAPI.shared.getHourlyWeather(lat: lat, lon: lon, completion: { (response) in
////            switch response {
////            case .success(let data):
////                print("success", data)
////                if let data = data as? HourlyWelcome {
////                    for item in data.list {
////                        self.hourlyWeatherArray.append(["time": extractHour(from: item.dtTxt), "weather": item.weather.first?.icon ?? "icon", "temp": Int(item.main.tempMin)])
////                    }
//                    
////                    weatherDetailViewController.descriptionText = "\(extractHour(from: response.list[1].dtTxt) ?? "text")시에 \(response.list[1].weather.first?.description ?? "description")과, \(extractHour(from: response.list[2].dtTxt) ?? "text")시에 \(response.list[2].weather.first?.description ?? "description")가 예상됩니다."
//                    
//                    for data in self.hourlyWeatherArray {
//                        weatherCollectionViewData.append(WeatherCollectionViewData(time: "\(data["time"] as? String ?? "")시", weather: data["weather"] as? String ?? "", temperature: "\(data["temp"] as? Int ?? 0)°"))
//                    }
//                }
//            case .requestErr(let statusCode):
//                print("requestErr", statusCode)
//            case .pathErr:
//                print(".pathErr")
//            case .serverErr:
//                print("serverErr")
//            case .networkFail:
//                print("networkFail")
//            }
//        })
    }
//    
//    
}
