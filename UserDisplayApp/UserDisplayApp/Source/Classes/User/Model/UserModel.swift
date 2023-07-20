//
//  UserModel.swift
//  UserDisplayApp
//
//  Created by Ankit Chauhan on 19/07/23.
//

import Foundation

struct UserModel: Codable {
    public var page: Int?
    public var perPage: Int?
    public var total: Int?
    public var totalPages: Int?
    public var userData: [UserData]?
        
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case perPage = "per_page"
        case total = "total"
        case totalPages = "total_pages"
        case userData = "data"
    }
}

struct UserData: Codable {
    public var id: Int?
    public var email: String?
    public var firstName: String?
    public var lastName: String?
    public var avatar: String?
        
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case email = "email"
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar = "avatar"
    }
}

