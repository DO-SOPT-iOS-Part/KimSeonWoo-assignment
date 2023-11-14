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
    let temperature: Int
    let maxTemperature: Int
    let minTemperature: Int
    let lon: Double
    let lat: Double
    
    init(location: String, weather: String, temperature: Int, maxTemperature: Int, minTemperature: Int, lon: Double, lat: Double) {
        self.location = location
        self.weather = weather
        self.temperature = temperature
        self.maxTemperature = maxTemperature
        self.minTemperature = minTemperature
        self.lat = lat
        self.lon = lon
    }
}

var weatherListViewData: [WeatherListViewData] = [
]

let weatherListViewController = WeatherListViewController()



