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
        case .getCurrentWeather(let cityName):
            return URLConstant.baseURL + "/weather?q=\(cityName)&units=metric&lang=kr&appid=\(Bundle.main.apikey)"
        case .getHourlyWeather(let lat, let lon):
            return URLConstant.baseURL + "/forecast?lat=\(lat)&lon=\(lon)&units=metric&lang=kr&appid=\(Bundle.main.apikey)"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}

