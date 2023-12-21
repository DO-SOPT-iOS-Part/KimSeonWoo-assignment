//
//  assignment1++Bundle.swift
//  assignment1
//
//  Created by Seonwoo Kim on 12/14/23.
//

import Foundation

extension Bundle {
    var apikey: String {
        guard let path = Bundle.main.path(forResource: "Config", ofType: "plist"),
              let xml = FileManager.default.contents(atPath: path),
              let config = try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainers, format: nil) as? [String: Any],
              let key = config["API_KEY"] as? String else {
            fatalError("API_KEY not found in Config.plist")
        }
        return key
    }
}
