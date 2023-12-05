//
//  CurrentWeatherDataModel.swift
//  assignment1
//
//  Created by Seonwoo Kim on 2023/11/14.
// 
import Foundation

// MARK: - WeatherResponseDTO
struct CurrentWeatherDataModel: Codable {
    let coord: CurrentCoord
    let weather: [Weathers]
    let base: String
    let main: Main
    let visibility: Int
    let wind: CurrentWind
    let clouds: CurrentClouds
    let dt: Int
    let sys: CurrentSys
    let timezone, id: Int
    let name: String
    let cod: Int
}

// MARK: - Clouds
struct CurrentClouds: Codable {
    let all: Int
}

// MARK: - Coord
struct CurrentCoord: Codable {
    let lon, lat: Double
}

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int
    let seaLevel, grndLevel: Int?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case pressure, humidity
    }
}

// MARK: - Sys
struct CurrentSys: Codable {
    let type, id: Int?
    let country: String
    let sunrise, sunset: Int
}

// MARK: - Weather
struct Weathers: Codable {
    let id: Int
    let main, description, icon: String
}

// MARK: - Wind
struct CurrentWind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double?
}

