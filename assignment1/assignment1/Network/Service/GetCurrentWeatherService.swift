//
//  GetCurrentWeatherService.swift
//  assignment1
//
//  Created by Seonwoo Kim on 2023/11/14.
//

import Foundation

class GetCurrentWeatherService {
    static let shared = GetCurrentWeatherService()
    private init() {}
    
    func makeRequest(cityName: String) -> URLRequest {
        guard let path = Bundle.main.path(forResource: "Config", ofType: "plist"),
              let xml = FileManager.default.contents(atPath: path),
              let config = try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainers, format: nil) as? [String: Any],
              let apiKey = config["API_KEY"] as? String else {
            fatalError("API_KEY not found in Config.plist")
        }
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&units=metric&lang=kr&appid=\(apiKey)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        return request
    }

    
    func GetCurrentWeatherData(cityName: String) async throws -> CurrentWeatherDataModel? {
        do {
            let request = self.makeRequest(cityName: cityName)
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.responseError
            }
            return parseCurrentWeatherData(data: data)
        } catch {
            throw error
        }
        
    }
    
    
    private func parseCurrentWeatherData(data: Data) -> CurrentWeatherDataModel? {
        do {
            let jsonDecoder = JSONDecoder()
            let result = try jsonDecoder.decode(CurrentWeatherDataModel.self, from: data)
            return result
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


