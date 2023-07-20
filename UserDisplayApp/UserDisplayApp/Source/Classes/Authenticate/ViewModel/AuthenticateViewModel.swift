//
//  AuthenticateViewModel.swift
//  UserDisplayApp
//
//  Created by Ankit Chauhan on 19/07/23.
//

import Foundation

class AuthenticateViewModel: BaseViewModel {
    static let shared = AuthenticateViewModel()
    let apiManager = APIManager.shared()
    var email = String()
    var password = String()
}

extension AuthenticateViewModel {           
    func loginCall(_ completion: @escaping(_ response: authenticationToken?, _ errorMessage: AlertMessage?) -> Void) {
        let loginData = LoginBody(email: self.email, password: self.password)
        self.decode(modelType: loginData)
        self.apiManager.call(type: EndpointItem.login as EndPointType, params: postParams) { (response, errorMessage) in
            completion(response, errorMessage)
        }
    }
    
    func registerCall(_ completion: @escaping(_ response: authenticationToken?, _ errorMessage: AlertMessage?) -> Void) {
        let loginData = LoginBody(email: self.email, password: self.password)
        self.decode(modelType: loginData)
        self.apiManager.call(type: EndpointItem.registatrion as EndPointType, params: postParams) { (response, errorMessage) in
            completion(response, errorMessage)
        }
    }
    
    func checkValidation() -> (Bool,String?) {
        if email != "" && password != "" && email.isValidEmail {
            return (true, nil)
        } else if !email.isValidEmail {
            return (false, "Please enter valid email!")
        } else if !email.isValidPassword {
            return (false, "Please enter valid password!")
        } else {
            return (false, "Please enter valid email and password!")
        }
    }

}
