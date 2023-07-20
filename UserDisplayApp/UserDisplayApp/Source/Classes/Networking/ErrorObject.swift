//
//  ErrorObject.swift
//  UserDisplayApp
//
//  Created by Ankit Chauhan on 19/07/23.
//

import Foundation

struct ErrorObject: Codable {
    let errorBody: String?
    
    enum CodingKeys: String, CodingKey {
        case errorBody = "error"
    }
}
