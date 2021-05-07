//
//  Extension+Error.swift
//  Xonder
//
//  Created by Daniyal Waseem on 06/05/2021.
//

import Foundation
import Moya

extension Error{
    var customDescription:String{
        get{
            if let error = self as? MoyaError, let response = error.response,
                let json = try? response.mapJSON() as? [String: Any],
                let message = json["message"] as? String{
                return message
            }
            return localizedDescription
        }
    }
}
