//
//  APIResult.swift
//  Tark
//
//  Created by macbook on 29/10/2019.
//  Copyright © 2019 Invision. All rights reserved.
//

import Result

enum APIResult<T>{
    case success(T)
    case failure(String)
}
