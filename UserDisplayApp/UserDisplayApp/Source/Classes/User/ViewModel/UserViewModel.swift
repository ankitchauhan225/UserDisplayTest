//
//  UserViewModel.swift
//  UserDisplayApp
//
//  Created by Ankit Chauhan on 20/07/23.
//

import Foundation

class UserViewModel: BaseViewModel {
    static let shared = UserViewModel()
    let apiManager = APIManager.shared()
    var userListData = [UserData]()
}

extension UserViewModel {
    func callUserList(_ completion : @escaping (UserModel?, AlertMessage?) -> Void) {
        self.apiManager.call(type: EndpointItem.getUserData as EndPointType, params: nil) { (response , errorMessage) in            
            completion(response, errorMessage)
        }
    }
}
