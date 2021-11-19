//
//  Image.swift
//  FindYourDog
//
//  Created by Dheeraj Verma on 17/11/21.
//
import Foundation
struct ImageModel : Codable {
	let height : Int?
	let id : String?
	let url : String?
	let width : Int?

	enum CodingKeys: String, CodingKey {

		case height = "height"
		case id = "id"
		case url = "url"
		case width = "width"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		height = try values.decodeIfPresent(Int.self, forKey: .height)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		width = try values.decodeIfPresent(Int.self, forKey: .width)
	}

}
