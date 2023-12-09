//
//  GetHoulyWeatherService.swift
//  assignment1
//
//  Created by Seonwoo Kim on 2023/11/14.
//

import Foundation

class GetHourlyWeatherService {
    static let shared = GetHourlyWeatherService()
    private init() {}

    func makeRequest(lon: Int, lat:Int) -> URLRequest {
        guard let path = Bundle.main.path(forResource: "Config", ofType: "plist"),
              let xml = FileManager.default.contents(atPath: path),
              let config = try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainers, format: nil) as? [String: Any],
              let apiKey = config["API_KEY"] as? String else {
            fatalError("API_KEY not found in Config.plist")
        }
        
        let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(lon)&units=metric&lang=kr&appid=\(apiKey)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        return request
    }
    
    func GetHourlyWeatherData(lon: Int, lat:Int) async throws -> HourlyWelcome? {
        do {
            let request = self.makeRequest(lon: lon, lat:lat)
            let (data, response) = try await URLSession.shared.data(for: request)
            guard response is HTTPURLResponse else {
                throw NetworkError.responseError
            }
            return parseHourlyWeatherData(data: data)
        } catch {
            throw error
        }
        
    }
    
    
    private func parseHourlyWeatherData(data: Data) -> HourlyWelcome? {
        do {
            let jsonDecoder = JSONDecoder()
            let result = try jsonDecoder.decode(HourlyWelcome.self, from: data);           return result
        } catch {
            print(error)
            return nil
        }
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode)
        ?? NetworkError.unknownError
    }
    
}



