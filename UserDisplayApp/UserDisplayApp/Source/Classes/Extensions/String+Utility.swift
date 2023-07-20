//
//  String+Utility.swift
//  UserDisplayApp
//
//  Created by Ankit Chauhan on 20/07/23.
//

import UIKit

extension String {
    static var strSelfMatch = "SELF MATCHES %@"
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: String.strSelfMatch, emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    var isValidPassword: Bool {
        let passRegEx = "^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z]).{8,64}$"
        let passTest = NSPredicate(format: String.strSelfMatch, passRegEx)
        return passTest.evaluate(with: self)
    }
    
}
