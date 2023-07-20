//
//  RegisterViewController.swift
//  UserDisplayApp
//
//  Created by Ankit Chauhan on 20/07/23.
//

import UIKit
import JGProgressHUD

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var txtPassword: FormTextField!
    @IBOutlet weak var txtUsername: FormTextField!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        lblTitle.textColor = UIColor.init(hexString: "#CD1B41")
    }
    
    @IBAction func BtnRegisterPress(_ sender: Any) {
        AuthenticateViewModel.shared.email = txtUsername.text ?? ""
        AuthenticateViewModel.shared.password = txtPassword.text ?? ""

        let result = AuthenticateViewModel.shared.checkValidation()

        if result.0 == true {
            let hud = JGProgressHUD()
            hud.textLabel.text = "Loading"
            hud.show(in: self.view)

            AuthenticateViewModel.shared.registerCall() { response, msg in
                hud.dismiss()
                if (msg != nil) {
                    let alert = UIAlertController(title: "", message: msg?.body, preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                } else {
                    self.dismiss(animated: true)
                }
            }
        } else {
            let alert = UIAlertController(title: "", message: AuthenticateViewModel.shared.checkValidation().1, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }

    }
    
}
