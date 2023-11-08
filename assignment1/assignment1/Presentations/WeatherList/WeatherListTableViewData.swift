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
    .init(location: "Seoul", weather: "흐림", temperature: "25°", maxTemperature: "최고:27°", minTemperature: "최저:23°"),
    .init(location: "Sydney", weather: "흐림", temperature: "25°", maxTemperature: "최고:27°", minTemperature: "최저:23°"),
    .init(location: "Incheon", weather: "흐림", temperature: "25°", maxTemperature: "최고:27°", minTemperature: "최저:23°"),
    .init(location: "Tokyo", weather: "흐림", temperature: "25°", maxTemperature: "최고:27°", minTemperature: "최저:23°"),
    .init(location: "Texas", weather: "흐림", temperature: "25°", maxTemperature: "최고:27°", minTemperature: "최저:23°"),
]


