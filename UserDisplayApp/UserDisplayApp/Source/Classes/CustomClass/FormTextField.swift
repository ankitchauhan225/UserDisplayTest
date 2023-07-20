//
//  FormTextField.swift
//  UserDisplayApp
//
//  Created by Ankit Chauhan on 20/07/23.
//

import UIKit

class FormTextField: UITextField {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let underlineView = UIView()
        underlineView.translatesAutoresizingMaskIntoConstraints = false
//        underlineView.backgroundColor = .brown
        underlineView.backgroundColor = UIColor(red: 185/255.0, green: 185/255.0, blue: 185/255.0, alpha: 1)
        
        addSubview(underlineView)
        
        NSLayoutConstraint.activate([
            
            underlineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            underlineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            underlineView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            underlineView.heightAnchor.constraint(equalToConstant: 1)
            ])
    }
    
}

