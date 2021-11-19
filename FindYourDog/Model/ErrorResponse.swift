//
//  Error.swift
//  Visibility
//
//  Created by Dheeraj Verma on 11/06/21.
//

import Foundation

struct ErrorResponse: Codable {
    var error: String?
    var errorDescription: String?

    init() {

    }

    enum CodingKeys: String, CodingKey {
        case error = "error"
        case errorDescription = "error_description"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        error = try values.decodeIfPresent(String.self, forKey: .error)
        errorDescription = try values.decodeIfPresent(String.self, forKey: .errorDescription)
    }
}
