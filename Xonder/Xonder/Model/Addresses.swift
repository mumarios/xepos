/* 

*/

import Foundation
struct Addresses : Codable {
    var postalCode:String?
    var latitude:Double?
    var longitude:Double?
	let formatted_address : [String]?
	let thoroughfare : String?
	let building_name : String?
	let sub_building_name : String?
	let sub_building_number : String?
	let building_number : String?
	let line_1 : String?
	let line_2 : String?
	let line_3 : String?
	let line_4 : String?
	let locality : String?
	let town_or_city : String?
	let county : String?
	let district : String?
	let country : String?

	enum CodingKeys: String, CodingKey {
        case postalCode = "postalCode"
        case latitude = "latitude"
        case longitude = "longitude"
		case formatted_address = "formatted_address"
		case thoroughfare = "thoroughfare"
		case building_name = "building_name"
		case sub_building_name = "sub_building_name"
		case sub_building_number = "sub_building_number"
		case building_number = "building_number"
		case line_1 = "line_1"
		case line_2 = "line_2"
		case line_3 = "line_3"
		case line_4 = "line_4"
		case locality = "locality"
		case town_or_city = "town_or_city"
		case county = "county"
		case district = "district"
		case country = "country"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		formatted_address = try values.decodeIfPresent([String].self, forKey: .formatted_address)
		thoroughfare = try values.decodeIfPresent(String.self, forKey: .thoroughfare)
		building_name = try values.decodeIfPresent(String.self, forKey: .building_name)
		sub_building_name = try values.decodeIfPresent(String.self, forKey: .sub_building_name)
		sub_building_number = try values.decodeIfPresent(String.self, forKey: .sub_building_number)
		building_number = try values.decodeIfPresent(String.self, forKey: .building_number)
		line_1 = try values.decodeIfPresent(String.self, forKey: .line_1)
		line_2 = try values.decodeIfPresent(String.self, forKey: .line_2)
		line_3 = try values.decodeIfPresent(String.self, forKey: .line_3)
		line_4 = try values.decodeIfPresent(String.self, forKey: .line_4)
		locality = try values.decodeIfPresent(String.self, forKey: .locality)
		town_or_city = try values.decodeIfPresent(String.self, forKey: .town_or_city)
		county = try values.decodeIfPresent(String.self, forKey: .county)
		district = try values.decodeIfPresent(String.self, forKey: .district)
		country = try values.decodeIfPresent(String.self, forKey: .country)
	}

}
