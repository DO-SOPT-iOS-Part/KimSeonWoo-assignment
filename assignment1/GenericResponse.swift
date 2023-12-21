//
//  GenericResponse.swift
//  assignment1
//
//  Created by Seonwoo Kim on 12/14/23.
//

import Foundation

struct GenericResponse<T: Codable>: Codable {
    var code: Int
    var message: String?
    var data: T?
    
    enum CodingKeys: String, CodingKey {
        case code, message, data
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = (try? values.decode(Int.self, forKey: .code)) ?? 0
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(T.self, forKey: .data)) ?? nil
    }
}
