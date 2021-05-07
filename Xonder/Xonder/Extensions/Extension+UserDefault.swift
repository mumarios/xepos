//
//  Extension+UserDefault.swift
//  Xonder
//
//  Created by Daniyal Waseem on 06/05/2021.
//

import Foundation
extension UserDefaults {
    func decode<T : Codable>(for type: T.Type, using key : String) -> T? {
        guard let data = UserDefaults.standard.object(forKey: key) as? Data else { return nil }
        return try? PropertyListDecoder().decode(type, from: data)
    }
    
    func encode<T : Codable>(for type: T?, using key : String) {
        let encodedData = try? PropertyListEncoder().encode(type)
        UserDefaults.standard.set(encodedData, forKey: key)
        UserDefaults.standard.synchronize()
    }
}
class AppDefault {
    static let shared = UserDefaults.standard
    
    //MARK:- Reset UserDefault
    public static func resetUserDefault(){
        let dictionary = shared.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            
            //FIXME: I omit deleting of persisted language by user.
            if (key == "AppleLanguages" ||
                key == "hasUserSelectedAnyLanguage" ||
                key == "fcmToken" ||
                key == "deviceToken" ||
                key == "email" ||
                key == "password" ||
                key == "isCallAllowed" ||
                key == "allLanguages"
                ) {
                //Don't Remove These keys
            }else {
                shared.removeObject(forKey: key)
            }
        }
        print("UserDefault: \(shared.dictionaryRepresentation())")
    }
    //MARK:- Show Call Permission Alert
    public static var isCallAllowed: Bool {
        get {
            return shared.bool(forKey: "isCallAllowed")
        }
        set {
            shared.set(newValue, forKey: "isCallAllowed")
        }
    }
    //MARK:- Job ID
    public static var jobID: Int {
        get {
            return shared.integer(forKey: "job_id")
        }
        set {
            shared.set(newValue, forKey: "job_id")
        }
    }
    //MARK:- Independent Contracter Agreement
    public static var isAgreedICA: Bool {
        get {
            return shared.bool(forKey: "ICA")
        }
        set {
            shared.set(newValue, forKey: "ICA")
        }
    }
    //MARK:- DeviceToken
    public static var deviceToken: String {
        get{
            if let token = shared.string(forKey: "deviceToken") {
                return token
            }else{
                return ""
            }
        }
        set{
            shared.set(newValue, forKey: "deviceToken")
        }
    }
    //MARK:- fcmToken
    public static var fcmToken: String {
        get{
            if let token = shared.string(forKey: "fcmToken") {
                return token
            }else{
                return ""
            }
        }
        set{
            shared.set(newValue, forKey: "fcmToken")
        }
    }
    //MARK:- email
    public static var email: String {
        get{
            if let token = shared.string(forKey: "email") {
                return token
            }else{
                return ""
            }
        }
        set{
            shared.set(newValue, forKey: "email")
        }
    }
    //MARK:- password
    public static var password: String {
        get{
            if let token = shared.string(forKey: "password") {
                return token
            }else{
                return ""
            }
        }
        set{
            shared.set(newValue, forKey: "password")
        }
    }
    
    public static var userType: Int {
        get{
            return shared.integer(forKey: "UserType")
        }
        set{
            shared.set(newValue, forKey: "UserType")
        }
    }
    
    public static var isRemember: Bool?{
        get{
            if let isRemember = shared.bool(forKey: "isRemember") as Bool?{
                return isRemember
            }else{
                return nil
            }
        }
        set{
            shared.set(newValue, forKey: "isRemember")
        }
    }
    public static var recentJobId: Int? {
        get {
            if let id = shared.integer(forKey: "recentJobId") as Int? {
                return id
            }else{
                return nil
            }
        }
        set{
            shared.setValue(newValue, forKey: "recentJobId")
        }
    }
    
}
