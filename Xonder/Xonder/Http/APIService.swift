//
//  APIService.swift
//  Xonder
//
//  Created by Daniyal Waseem on 06/05/2021.
//

import Foundation
import UIKit
class APIService{

    class func signup(userObj:[String:Any],
                      completion:@escaping (APIResult<User>)->Void){
        
        
        Provider.services.request(.signup(obj: userObj)) { (result) in
            switch result{
            case .success(let _):
                do{
                User.shared = try result.decoded(keypath: "data.user")
                User.shared.token = try result.decoded(keypath: "data.token")
                    
                    UserDefaults.standard.encode(for: User.shared, using: Constants.UserDefaultKeys.user)
                    
                    completion(.success(User.shared))
                }catch _{}
                break
            case .failure(let err):
                print(err.localizedDescription)
            break
            }
        }

    }
    
    class func searchCompanies(name: String, completion:@escaping([CompanyModel]?,String?)->Void){
        Provider.services.request(.searchCompanies(obj: name)) { (result) in
            do{
                let earnings: [CompanyModel] = try result.decoded(keypath: "data")
                completion(earnings,nil)
            }catch {
                if (error.localizedDescription == "Response status code was unacceptable: 401.") {
                    if UIApplication.topViewController() != nil{
                        
                    }

                }
                else {
                    completion(nil,error.localizedDescription)
                }
            }
        }
       
    }
    
    class func login(userObj:[String:Any],
                      completion:@escaping (APIResult<String>)->Void){
        
        
        Provider.services.request(.login(obj: userObj)) { (result) in
            switch result{
            case .success(let _):
                do{
                    var token:String = try result.decoded(keypath: "token")                    
                    completion(.success(token))
                }catch _{
                    print("Decode error")
                }
                break
            case .failure(let err):
                print(err.localizedDescription)
            break
            }
        }

    }
    
    class func sendOtp(userObj:[String:Any],completion:@escaping (APIResult<String>)->Void) {
        Provider.services.request(.sendOtp(obj: userObj)) { (result) in
            switch result{
            case .success(let _):
                do{
                  //  completion(.success("Succes"))
                    var sendOtp:String = try result.decoded(keypath: "message")
                    completion(.success(sendOtp))
                }catch _{
                    print("Decode error")
                }
                break
            case .failure(let err):
                print(err.localizedDescription)
            break
            }
        }
    }
    
    class func verifOtp(userObj:[String:Any],completion:@escaping (APIResult<String>)->Void ) {
        Provider.services.request(.verifyOtp(obj: userObj)) { (result) in
            switch result{
            case .success(let _):
                do{
                    let verifyOtp:String = try result.decoded(keypath: "message")
                    completion(.success(verifyOtp))
                }catch _{
                    print("Decode error")
                }
                break
            case .failure(let err):
                completion(.failure("Fail"))
                print(err.localizedDescription)
            break
            }
        }
    }
    
    class func getCountries(completion:@escaping([CountryModel]?,String?)->Void) {
        Provider.services.request(.getCountries) { (result) in
            do{
                let earnings: [CountryModel] = try result.decoded(keypath: "data")
                completion(earnings,nil)
            }catch {
                if (error.localizedDescription == "Response status code was unacceptable: 401.") {
                    if UIApplication.topViewController() != nil{
                        
                    }
//                    Alert.show(message: error.customDescription, actionTitle: "Ok") {
//                        APIService.logout()
//                    }
                }
                else {
                    completion(nil,error.localizedDescription)
                }
            }
        }
    }
}


