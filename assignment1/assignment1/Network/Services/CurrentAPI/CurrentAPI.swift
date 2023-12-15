//
//  CurrentAPI.swift
//  assignment1
//
//  Created by Seonwoo Kim on 12/14/23.
//

import Foundation
import Moya

final class CurrentAPI {
    
    static let shared = CurrentAPI()
    var weatherProvider = MoyaProvider<CurrentService>(plugins: [MoyaLoggerPlugin()])
    
    public init() { }

    func getCurrentWeather(cityName: String,completion: @escaping (NetworkResult<Any>) -> Void) {
        weatherProvider.request(.getCurrentWeather(cityName: cityName)) { (result) in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeCurrentWeatherStatus(by: statusCode, data)
                completion(networkResult)
                    
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getHourlyWeather (lat: Int, lon: Int,completion: @escaping (NetworkResult<Any>) -> Void) {
        weatherProvider.request(.getHourlyWeather(lat: lat, lon: lon)) { (result) in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeHourlyWeatherStatus(by: statusCode, data)
                completion(networkResult)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func judgeCurrentWeatherStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<CurrentWeatherDataModel>.self, from: data)
        else {
            return .pathErr
        }
        switch statusCode {
        case 200:
            return .success(decodedData.data ?? "success")
        case 400..<500:
            return .requestErr(decodedData.code)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
    
    private func judgeHourlyWeatherStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<HourlyWelcome>.self, from: data)
        else {
            return .pathErr
        }
        switch statusCode {
        case 200:
            return .success(decodedData.data ?? "success")
        case 400..<500:
            return .requestErr(decodedData.code)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
}
