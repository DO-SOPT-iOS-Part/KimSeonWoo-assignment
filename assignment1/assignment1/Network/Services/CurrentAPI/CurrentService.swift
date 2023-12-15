//
//  CurrentService.swift
//  assignment1
//
//  Created by Seonwoo Kim on 12/14/23.
//

import Foundation
import Moya

enum CurrentService: TargetType {
    case getCurrentWeather(cityName: String)
    case getHourlyWeather(lat: Int, lon: Int)

    var baseURL: URL {
        return URL(string: URLConstant.baseURL)!
    }

    var path: String {
        switch self {
        case .getCurrentWeather:
            return "/weather"
        case .getHourlyWeather:
            return "/forecast"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        switch self {
        case .getCurrentWeather(let cityName):
            let parameters: [String: Any] = [
                "q": cityName,
                "units": "metric",
                "lang": "kr",
                "appid": Bundle.main.apikey
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)

        case .getHourlyWeather(let lat, let lon):
            let parameters: [String: Any] = [
                "lat": lat,
                "lon": lon,
                "units": "metric",
                "lang": "kr",
                "appid": Bundle.main.apikey
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }

    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
