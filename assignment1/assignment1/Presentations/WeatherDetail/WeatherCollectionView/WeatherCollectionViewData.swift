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
    let temperature: String
    
    
    init(time: String, weather: String, temperature: String) {
        self.time = time
        self.weather = weather
        self.temperature = temperature
    }
}

var weatherCollectionViewData: [WeatherCollectionViewData] = [.init(time: "12시", weather: "cloudBolt", temperature: "21°"),
                                                              .init(time: "12시", weather: "cloudBolt", temperature: "21°"),
                                                              .init(time: "12시", weather: "cloudBolt", temperature: "21°"),
                                                              .init(time: "12시", weather: "cloudBolt", temperature: "21°"),
                                                              .init(time: "12시", weather: "cloudBolt", temperature: "21°"),
                                                              .init(time: "12시", weather: "cloudBolt", temperature: "21°"),
                                                              .init(time: "12시", weather: "cloudBolt", temperature: "21°"),
                                                              .init(time: "12시", weather: "cloudBolt", temperature: "21°"),
                                                              .init(time: "12시", weather: "cloudBolt", temperature: "21°"),
                                                              .init(time: "12시", weather: "cloudBolt", temperature: "21°"),
                                                              .init(time: "12시", weather: "cloudBolt", temperature: "21°"),
]
