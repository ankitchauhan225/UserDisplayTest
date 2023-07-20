//
//  BaseViewModel.swift
//  UserDisplayApp
//
//  Created by Ankit Chauhan on 19/07/23.
//

import Foundation

class BaseViewModel {
    var postParams: [String: Any]?

    func decode<T>(modelType: T) where T: Encodable {
        do {
            let jsonData = try JSONEncoder().encode(modelType)
            if let aPostParams  = try (JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions()) as? [ String: Any]) {
                postParams = aPostParams
            }
        } catch {
            // Some parsing issue.
        }
    }
}
