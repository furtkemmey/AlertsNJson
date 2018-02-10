//
//	Entry.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Entry : Codable {

	let author : Author?
	let category : Category?
	let id : String?
	let link : Link?
	let summary : Summary?
	let title : String?
	let updated : String?


	enum CodingKeys: String, CodingKey {
		case author
		case category
		case id = "id"
		case link
		case summary
		case title = "title"
		case updated = "updated"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		author = try Author(from: decoder)
		category = try Category(from: decoder)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		link = try Link(from: decoder)
		summary = try Summary(from: decoder)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		updated = try values.decodeIfPresent(String.self, forKey: .updated)
	}

}