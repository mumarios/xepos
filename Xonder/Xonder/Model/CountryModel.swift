//
//  CountryModel.swift
//  Xonder
//
//  Created by Daniyal Waseem on 06/05/2021.
//

import Foundation
class CountryModel: Codable {
    let id:Int
    let name:String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
}
