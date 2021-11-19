//
//  HeightModel.swift
//  FindYourDog
//
//  Created by Dheeraj Verma on 17/11/21.
//
import Foundation

struct HeightModel : Codable {
	let imperial : String?
	let metric : String?

	enum CodingKeys: String, CodingKey {

		case imperial = "imperial"
		case metric = "metric"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		imperial = try values.decodeIfPresent(String.self, forKey: .imperial)
		metric = try values.decodeIfPresent(String.self, forKey: .metric)
	}

}
