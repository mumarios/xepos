//
//  Services.swift
//  Xonder
//
//  Created by Daniyal Waseem on 06/05/2021.
//

import Foundation
import Moya

enum Services {
    //
    // ========== ALL APIS ALONG WITH PARAMETERS
    //
    case signup(obj:[String:Any])
    case getCountries
    case login(obj:[String:Any])
    case searchCompanies(name: String)
    case sendOtp(obj:[String:Any])
    case verifyOtp(obj:[String:Any])
    case getCategories
    case getTypes
}

extension Services:TargetType,AccessTokenAuthorizable{
    
    var baseURL: URL {
        return Constants.API.baseUrl!
    }
    
    //
    // ======= PATHS
    //
    
    
    var path: String {
        switch self {
        case .signup:
            return "signup"
        case .getCountries:
            return "get-all-countries"
        case .login:
            return "sanctum/token"
        case .searchCompanies:
            return "filters/search-companies"
        case .sendOtp:
            return "sent-otp-to-number"
        case .verifyOtp:
            return "verify-otp-to-number"
        case .getCategories:
            return "filters/get-business-industry-code"
        case .getTypes:
            return "filters/get-business-industry-type"

        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signup,.login,.sendOtp,.verifyOtp:
            return .post
        default:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .signup(let obj):
            return .requestParameters(parameters: obj, encoding: JSONEncoding.default)
        case .login(let obj):
            return .requestParameters(parameters: obj, encoding: JSONEncoding.default)

        case .getCountries:
            return .requestPlain
            
        case .searchCompanies(let name):
            return .requestParameters(parameters: ["q" : name], encoding: URLEncoding.queryString)
            
        case .getCategories:
            return .requestPlain
        case .getTypes:
            return .requestPlain
            
        case .sendOtp(let obj):
            return .requestParameters(parameters: obj, encoding: JSONEncoding.default)
        case .verifyOtp(let obj):
            return .requestParameters(parameters: obj, encoding: JSONEncoding.default)
    }
    }
    
    var headers: [String : String]? {
        return [
            "Content-type": "application/json",
            "Accept": "application/json"
        ]
    }
    
    var authorizationType: AuthorizationType {
        switch self{
        case .signup,.login,.searchCompanies,.sendOtp,.verifyOtp, .getCategories, .getTypes:
            return .none
        default:
            return .bearer
        }
    }
    
    var validationType: ValidationType{
        return .successCodes
    }
    
    
}
