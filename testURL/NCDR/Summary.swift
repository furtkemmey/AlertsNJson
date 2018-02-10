//
//	Summary.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Summary : Codable {

    let text : String?
	let type : String?


	enum CodingKeys: String, CodingKey {
		case text = "#text"
		case type = "@type"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		text = try values.decodeIfPresent(String.self, forKey: .text)
		type = try values.decodeIfPresent(String.self, forKey: .type)
	}

}
