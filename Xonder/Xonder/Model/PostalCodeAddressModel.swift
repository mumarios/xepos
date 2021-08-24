/* 

*/

import Foundation
struct PostalCodeAddressModel : Codable {
	let postcode : String?
	let latitude : Double?
	let longitude : Double?
	let addresses : [Addresses]?

	enum CodingKeys: String, CodingKey {

		case postcode = "postcode"
		case latitude = "latitude"
		case longitude = "longitude"
		case addresses = "addresses"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		postcode = try values.decodeIfPresent(String.self, forKey: .postcode)
		latitude = try values.decodeIfPresent(Double.self, forKey: .latitude)
		longitude = try values.decodeIfPresent(Double.self, forKey: .longitude)
		addresses = try values.decodeIfPresent([Addresses].self, forKey: .addresses)
	}

}
