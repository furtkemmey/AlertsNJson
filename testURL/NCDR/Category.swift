//
//	Category.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Category : Codable {

	let term : String?


	enum CodingKeys: String, CodingKey {
		case term = "@term"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		term = try values.decodeIfPresent(String.self, forKey: .term)
	}

}