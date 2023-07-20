//
//  EndpointType.swift
//  UserDisplayApp
//
//  Created by Ankit Chauhan on 19/07/23.
//

import Foundation
import Alamofire

protocol EndPointType {

    // MARK: - Vars & Lets
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var url: URL { get }
    var encoding: ParameterEncoding { get }
}

protocol EndPointProtocol {
    func raw() -> String
}

enum EndPoint {
    enum Authentication: EndPointProtocol {
        case login
        case registatrion

        func raw() -> String {
            switch self {
                case .login:
                    return "api/login"
                case .registatrion:
                    return "api/register"
            }
        }
    }
}

enum Endpoint {
    enum User: EndPointProtocol {
        case addUser
        case getUserData
        
        func raw() -> String {
            switch self {
            case .addUser:
                return "api/users"
            case .getUserData:
                return "api/users?page=1"
            }
        }
    }
}
