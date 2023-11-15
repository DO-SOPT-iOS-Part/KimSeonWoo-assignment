//
//  WeatherCollectionViewData.swift
//  assignment1
//
//  Created by Seonwoo Kim on 2023/11/07.
//

import Foundation

struct WeatherCollectionViewData {
    let time: String
    let weather: String
    let temperature: Int
    
    
    init(time: String, weather: String, temperature:Int) {
        self.time = time
        self.weather = weather
        self.temperature = temperature
    }
}

var weatherCollectionViewData: [WeatherCollectionViewData] = [
]
