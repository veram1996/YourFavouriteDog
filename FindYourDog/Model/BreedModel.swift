//
//  Breed.swift
//  FindYourDog
//
//  Created by Dheeraj Verma on 17/11/21.
//
import Foundation
struct BreedModel : Codable {
	let bredFor : String?
	let breedGroup : String?
	let height : HeightModel?
	let id : Int?
	let image : ImageModel?
	let lifeSpan : String?
	let name : String?
	let origin : String?
	let referenceImageId : String?
	let temperament : String?
	let weight : WeightModel?

	enum CodingKeys: String, CodingKey {

		case bredFor = "bred_for"
		case breedGroup = "breed_group"
		case height = "height"
		case id = "id"
		case image = "image"
		case lifeSpan = "life_span"
		case name = "name"
		case origin = "origin"
		case referenceImageId = "reference_image_id"
		case temperament = "temperament"
		case weight = "weight"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        bredFor = try values.decodeIfPresent(String.self, forKey: .bredFor)
		breedGroup = try values.decodeIfPresent(String.self, forKey: .breedGroup)
		height = try values.decodeIfPresent(HeightModel.self, forKey: .height)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		image = try values.decodeIfPresent(ImageModel.self, forKey: .image)
		lifeSpan = try values.decodeIfPresent(String.self, forKey: .lifeSpan)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		origin = try values.decodeIfPresent(String.self, forKey: .origin)
		referenceImageId = try values.decodeIfPresent(String.self, forKey: .referenceImageId)
		temperament = try values.decodeIfPresent(String.self, forKey: .temperament)
		weight = try values.decodeIfPresent(WeightModel.self, forKey: .weight)
	}

}
