//
//  AuthenticateModel.swift
//  UserDisplayApp
//
//  Created by Ankit Chauhan on 20/07/23.
//

import Foundation

struct authenticationToken: Codable {
    public var token: String?
    public var id: Int?
        
    enum CodingKeys: String, CodingKey {
        case token = "token"
        case id = "id"
    }
}

public struct LoginBody: Codable {
    public var email: String?
    public var password: String?
}
