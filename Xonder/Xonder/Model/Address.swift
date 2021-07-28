/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

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