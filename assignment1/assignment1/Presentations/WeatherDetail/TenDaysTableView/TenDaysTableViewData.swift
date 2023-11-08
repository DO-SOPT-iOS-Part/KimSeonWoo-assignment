//
//  TenDaysTableViewData.swift
//  assignment1
//
//  Created by Seonwoo Kim on 2023/11/08.
//

import Foundation

struct TenDaysTableViewData {
    let date: String
    let weatherImage: String
    let minTemp: String
    let maxTemp: String
    var degreeBar: String
    
    init(date: String, weatherImage: String, minTemp: String, maxTemp: String, degreeBar: String) {
        self.date = date
        self.weatherImage = weatherImage
        self.minTemp = minTemp
        self.maxTemp = maxTemp
        self.degreeBar = degreeBar
    }
}


var tenDaysTableViewData: [TenDaysTableViewData] = [.init(date: "오늘",
                                                          weatherImage: "softRain",
                                                          minTemp: "25°",
                                                          maxTemp: "25°",
                                                          degreeBar: "tempBar1"),
                                                    .init(date: "오늘",
                                                          weatherImage: "softRain",
                                                          minTemp: "25°",
                                                          maxTemp: "25°",
                                                          degreeBar: "tempBar1"),
                                                    .init(date: "오늘",
                                                          weatherImage: "softRain",
                                                          minTemp: "25°",
                                                          maxTemp: "25°",
                                                          degreeBar: "tempBar1"),
                                                    .init(date: "오늘",
                                                          weatherImage: "softRain",
                                                          minTemp: "25°",
                                                          maxTemp: "25°",
                                                          degreeBar: "tempBar1"),
                                                    .init(date: "오늘",
                                                          weatherImage: "softRain",
                                                          minTemp: "25°",
                                                          maxTemp: "25°",
                                                          degreeBar: "tempBar1"),
                                                    .init(date: "오늘",
                                                          weatherImage: "softRain",
                                                          minTemp: "25°",
                                                          maxTemp: "25°",
                                                          degreeBar: "tempBar1"),
                                                    .init(date: "오늘",
                                                          weatherImage: "softRain",
                                                          minTemp: "25°",
                                                          maxTemp: "25°",
                                                          degreeBar: "tempBar1"),
                                                    .init(date: "오늘",
                                                          weatherImage: "softRain",
                                                          minTemp: "25°",
                                                          maxTemp: "25°",
                                                          degreeBar: "tempBar1"),
]
