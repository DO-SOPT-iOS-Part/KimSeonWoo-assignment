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
    
    let locationArray: [String] = ["gongju", "gwangju", "gunsan", "daegu", "daejeon"]
    var currentWeatherArray: [CurrentWeatherDataModel] = []
    var hourlyWeatherArray: Array<Dictionary<String, Any>> = []
    
    
    
    private let tableView = UITableView(frame: .zero, style: .plain).then {
        $0.backgroundColor = .black
    }
    
    private let moreButtonItem = UIBarButtonItem()
    private let locationSearchController = UISearchController()
    
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
    // 날씨 데이터 Api 관련 부분
    private func setCurrentWeatherData() {
        Task {
            do {
                for city in locationArray {
                    guard let response = try await GetCurrentWeatherService.shared.GetCurrentWeatherData(cityName: city) else { return }
                    currentWeatherArray.append(response)
                    weatherListViewData.append( .init(location: response.name, weather: response.weather.first?.description ?? "description", temperature: Int(response.main.temp), maxTemperature: Int(response.main.tempMax), minTemperature: Int(response.main.tempMin), lon: response.coord.lon,  lat: response.coord.lat))
                }
            } catch {
                print(error)
            }
        }
    }
    //시간 데이터를 포맷팅하는 함수
    func extractHour(from dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        if let date = dateFormatter.date(from: dateString) {
            let hourFormatter = DateFormatter()
            hourFormatter.dateFormat = "HH"
            return hourFormatter.string(from: date)
        } else {
            return nil
        }
    }
    
    func convertFahrenheitToCelsius(fahrenheit: Double) -> Int {
        let celsius = Int((fahrenheit - 32) * 5 / 9)
        return celsius
    }
    
    @objc func tapListView(_ sender: UITapGestureRecognizer) {
        if let indexPath = tableView.indexPathForRow(at: sender.location(in: tableView)) {
            // 터치한 셀의 indexPath를 확인하고 데이터에 접근
            let tappedCellData = isFiltering ? filteredLocationData[indexPath.row] : weatherListViewData[indexPath.row]
            
            //WeatherDetailViewController 라벨 데이터를 전달
            let weatherDetailViewController = WeatherDetailViewController()
            weatherDetailViewController.cityLabelText = tappedCellData.location
            weatherDetailViewController.tempLabelText = String(tappedCellData.temperature)
            weatherDetailViewController.wheatherStatusLabelText = tappedCellData.weather
            weatherDetailViewController.minTempLabelText = "최저: \(tappedCellData.minTemperature) °C"
            weatherDetailViewController.maxTempLabelText = "최고: \(tappedCellData.maxTemperature) °C"
            
            Task {
                do {
                    guard let response = try await GetHourlyWeatherService.shared.GetHourlyWeatherData(lon:Int(tappedCellData.lon) , lat: Int(tappedCellData.lat)) else { return }
                    for item in response.list {
                        hourlyWeatherArray.append(["time": extractHour(from: item.dtTxt), "weather": item.weather.first?.icon ?? "icon", "temp": Int(item.main.tempMin)])
                    }
                } catch {
                    print(error)
                }
            }
            
            for data in hourlyWeatherArray {
                weatherCollectionViewData.append(WeatherCollectionViewData(time: data["time"] as? String ?? "", weather: data["weather"] as? String ?? "", temperature: data["temp"] as? Int ?? 0))

            }
            
            self.navigationController?.pushViewController(weatherDetailViewController, animated: true)
            self.navigationController?.isNavigationBarHidden = true }
            print(hourlyWeatherArray)
    }
}

extension WeatherListViewController: UITableViewDelegate {}
extension WeatherListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltering ? filteredLocationData.count : currentWeatherArray.count
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
        cell.bindData(data: dataToDisplay) // 데이터 원본 대신 필터링된 데이터를 전달
        return cell
    }
}


var filteredLocationData = [WeatherListViewData]()

extension WeatherListViewController: UISearchResultsUpdating {
    var isFiltering: Bool {
        let searchController = self.navigationItem.searchController
        let isActive = searchController?.isActive ?? false
        let isSearchBarHasText = searchController?.searchBar.text?.isEmpty == false
        
        return isActive && isSearchBarHasText
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        filteredLocationData = weatherListViewData.filter { return $0.location.lowercased().contains(text.lowercased()) }
        self.tableView.reloadData()
    }
}
