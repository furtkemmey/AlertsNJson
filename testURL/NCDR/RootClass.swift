//
//	RootClass.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct RootClass : Codable {

	let author : Author?
	let entry : [Entry]?
	let id : String?
	let link : Link?
	let title : String?
	let updated : String?


	enum CodingKeys: String, CodingKey {
		case author
		case entry = "entry"
		case id = "id"
		case link
		case title = "title"
		case updated = "updated"
	}
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        author = try Author(from: decoder)
//        entry = try values.decodeIfPresent([Entry].self, forKey: .entry)
//        id = try values.decodeIfPresent(String.self, forKey: .id)
//        link = try Link(from: decoder)
//        title = try values.decodeIfPresent(String.self, forKey: .title)
//        updated = try values.decodeIfPresent(String.self, forKey: .updated)
//    }

}
