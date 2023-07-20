//
//  EndpointItem.swift
//  UserDisplayApp
//
//  Created by Ankit Chauhan on 19/07/23.
//

import Foundation
import UIKit
import Alamofire

enum EndpointItem {
    // MARK: User actions
    case login
    case registatrion
    case getUserData
    case addUser
}


// MARK: - Extensions

// MARK: - EndPointType
extension EndpointItem: EndPointType {
    
    var baseURL: String {
        return "https://reqres.in/"
    }
    
    var path: String {
        switch self {
            // AUTH
        case .registatrion:
            return EndPoint.Authentication.registatrion.raw()
        case .login:
            return EndPoint.Authentication.login.raw()
        case .addUser:
            return Endpoint.User.addUser.raw()
        case .getUserData:
            return Endpoint.User.getUserData.raw()
        }
    }

    var httpMethod: HTTPMethod {
        switch self {
        case .login, .registatrion, .addUser :
            return .post
        case .getUserData:
            return .get        
        }
    }

    var headers: HTTPHeaders? {
        let cachecontrol = "Cache-Control"
        let cachecontrolValue = "no-cache, no-store"
        let contentTypeKey = "Content-Type"
        let contentTypeValue = "application/json"
        
        return [contentTypeKey: contentTypeValue, cachecontrol: cachecontrolValue]
    }

    var url: URL {
        return URL(string: self.baseURL + self.path)!
    }
    

    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
}
