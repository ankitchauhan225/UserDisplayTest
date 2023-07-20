//
//  ViewController.swift
//  UserDisplayApp
//
//  Created by Ankit Chauhan on 19/07/23.
//

import UIKit
import JGProgressHUD
class LoginViewController: UIViewController {
    
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtPassword: FormTextField!
    @IBOutlet weak var txtUsername: FormTextField!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI(){
        lblTitle.textColor = UIColor.init(hexString: "#CD1B41")
    }
    
    func getData() {
        
//        var login = LoginBody()
//        login.email = "eve.holt@reqres.in"
//        login.password = "cityslicka"
//
//        LoginViewModel.shared.loginCall(loginBody: login) { response, msg in
//            debugPrint(response)
//        }
        
//        LoginViewModel.shared.callUserList { resultData, msg in
//            debugPrint(resultData?.userData)
//        }
    }
    
    
    @IBAction func BtnLoginPress(_ sender: Any) {
        AuthenticateViewModel.shared.email = txtUsername.text ?? ""
        AuthenticateViewModel.shared.password = txtPassword.text ?? ""
        
        let result = AuthenticateViewModel.shared.checkValidation()
        if result.0 == true {
            let hud = JGProgressHUD()
            hud.textLabel.text = "Loading"
            hud.show(in: self.view)
            AuthenticateViewModel.shared.loginCall() { response, msg in
                hud.dismiss()
                if (msg == nil) {
                    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "UserListViewController") as? UserListViewController
                    self.navigationController?.pushViewController(vc!, animated: true)
                } else {
                    let alert = UIAlertController(title: "", message: msg?.body, preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        } else {
            let alert = UIAlertController(title: "", message: AuthenticateViewModel.shared.checkValidation().1, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}

