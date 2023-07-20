//
//  ErrorObject.swift
//  UserDisplayApp
//
//  Created by Ankit Chauhan on 19/07/23.
//

import Foundation

class ErrorObject: Codable {
    let message: String
    let key: String?
    let sysMessage: String?
}
