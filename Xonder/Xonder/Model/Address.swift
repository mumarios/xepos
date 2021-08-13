
import Foundation
struct Address : Codable {
	let locality : String?
	let address_line_1 : String?
	let address_line_2 : String?
	let premises : String?
	let postal_code : String?
	let country : String?

	enum CodingKeys: String, CodingKey {
        case locality = "locality"
		case address_line_1 = "address_line_1"
		case address_line_2 = "address_line_2"
		case premises = "premises"
		case postal_code = "postal_code"
		case country = "country"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		locality = try values.decodeIfPresent(String.self, forKey: .locality)
		address_line_1 = try values.decodeIfPresent(String.self, forKey: .address_line_1)
		address_line_2 = try values.decodeIfPresent(String.self, forKey: .address_line_2)
		premises = try values.decodeIfPresent(String.self, forKey: .premises)
		postal_code = try values.decodeIfPresent(String.self, forKey: .postal_code)
		country = try values.decodeIfPresent(String.self, forKey: .country)
	}

}
