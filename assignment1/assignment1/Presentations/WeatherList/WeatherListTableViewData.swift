//
//  WheatherListData.swift
//  assignment1
//
//  Created by Seonwoo Kim on 2023/11/06.
//

import Foundation


struct WeatherListViewData {
    let location: String
    let weather: String
    let temperature: String
    let maxTemperature: String
    let minTemperature: String
    
    init(location: String, weather: String, temperature: String, maxTemperature: String, minTemperature: String) {
        self.location = location
        self.weather = weather
        self.temperature = temperature
        self.maxTemperature = maxTemperature
        self.minTemperature = minTemperature
    }
}

var weatherListViewData: [WeatherListViewData] = [
]

let weatherListViewController = WeatherListViewController()



