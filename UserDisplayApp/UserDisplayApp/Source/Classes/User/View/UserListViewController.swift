//
//  UserListViewController.swift
//  UserDisplayApp
//
//  Created by Ankit Chauhan on 20/07/23.
//

import UIKit
import Foundation
import JGProgressHUD

class UserListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var detailsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.registerCell()
        self.callUserListAPI()
        // Do any additional setup after loading the view.
    }
}

// MARK: - API calls
extension UserListViewController {
    func callUserListAPI(){
        let hud = JGProgressHUD()
        hud.textLabel.text = "Loading"
        hud.show(in: self.view)

        
        UserViewModel.shared.callUserList({(userDetails, msg) in
            hud.dismiss()
            if msg != nil {
                let alert = UIAlertController(title: "", message: msg?.body, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else {
                UserViewModel.shared.userListData = userDetails?.userData ?? []
                self.detailsTableView.reloadData()
            }
        })
    }
}

extension UserListViewController {
    
    func registerCell() {
        detailsTableView.register(UINib(nibName: "UserListCell", bundle: .main), forCellReuseIdentifier: "UserListCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserViewModel.shared.userListData.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UserListCell", for: indexPath) as? UserListCell {
            cell.configureCell(forRow:UserViewModel.shared.userListData[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let currentCell = tableView.cellForRow(at: indexPath) as! UserListCell
        
        currentCell.configureCell(forRow: UserViewModel.shared.userListData[indexPath.row])

        
        
//        self.propertyViewModel.updateProperyData(indexPath: indexPath as NSIndexPath, {(isSuccess,msg) in
//            if isSuccess {
//                self.detailsTableView.reloadData()
//            } else {
//                let alert = UIAlertController(title: "Radius", message: msg, preferredStyle: UIAlertController.Style.alert)
//                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//                self.present(alert, animated: true, completion: nil)
//            }
//        })
    }
}
