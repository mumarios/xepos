//
//  Provider.swift
//  Xonder
//
//  Created by Daniyal Waseem on 06/05/2021.
//

import Foundation
import Moya

struct Provider {
    static let services = MoyaProvider<Services>(plugins: [Plugin.networkPlugin, NetworkLoggerPlugin(verbose: true), Plugin.authPlugin])
    static let backgroundServices = MoyaProvider<Services>(plugins: [NetworkLoggerPlugin(verbose: true), Plugin.authPlugin])
}
