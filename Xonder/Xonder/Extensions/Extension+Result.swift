//
//  Extension+Result.swift
//  Xonder
//
//  Created by Daniyal Waseem on 06/05/2021.
//

import Foundation
import Moya
import Result

extension Result {
    func resolve() throws -> Value {
        switch self {
        case .success(let value):
            return value
        case .failure(let error):
            throw error
        }
    }
}

extension Result where Value == Moya.Response {
    func decoded<T: Decodable>(keypath: String = "data") throws -> T {
        let decoder = JSONDecoder()
        let response = try resolve()
        return try response.map(T.self, atKeyPath: keypath, using: decoder, failsOnEmptyData: true)//decoder.decode(T.self, from: response.data)
    }
}
