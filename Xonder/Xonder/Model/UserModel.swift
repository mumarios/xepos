//
//  UserModel.swift
//  Xonder
//
//  Created by Daniyal Waseem on 06/05/2021.
//

import Foundation
class User: Codable {
    let id: Int?
    let name: String?
    let email: String?
    var firstName: String?
    var lastName: String?
    let phone: String?
    let dob: String?
    let stripeToken: String?
    let deviceToken: String?
    let about: String?
    var licenseShowed: Int?
    let role: [String]//Role
    var token:String?
    var rating: Double?
    var isOnline: Int?
    static var shared:User!
    static var deviceToken:String?
    
    
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case email = "email"
        case firstName = "first_name"
        case lastName = "last_name"
        case phone = "phone"
        case dob = "dob"
        case stripeToken = "customer_stripe_token"
        case deviceToken = "device_token"
        case about = "about_me"
        case licenseShowed = "licence_showed"
        case role = "role"
        case token = "token"
        case rating = "ratings"
        case isOnline = "is_online"
    }
}
