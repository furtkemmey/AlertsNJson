//
//	Link.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Link : Codable {

	let href : String?
	let rel : String?


	enum CodingKeys: String, CodingKey {
		case href = "@href"
		case rel = "@rel"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		href = try values.decodeIfPresent(String.self, forKey: .href)
		rel = try values.decodeIfPresent(String.self, forKey: .rel)
	}

}