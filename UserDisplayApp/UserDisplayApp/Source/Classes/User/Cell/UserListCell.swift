//
//  UserListCell.swift
//  TableV
//
//  Created by Ankit Chauhan iOS Team on 2/2/21.
//

import UIKit
import SDWebImage
class UserListCell: UITableViewCell, UITextFieldDelegate {
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var subTitleLabel: UILabel?
    @IBOutlet var userImage: UIImageView?
    @IBOutlet var overLayView: UIView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.overLayView?.backgroundColor = UIColor.init(hexString: "#CD1B41").withAlphaComponent(0.5)
        
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
    }
    
    func configureCell(forRow rowData: UserData) {
        titleLabel?.text = "\(rowData.firstName ?? "") \(rowData.lastName ?? "")"
        subTitleLabel?.text = rowData.email
        userImage?.sd_setImage(with: URL(string: rowData.avatar ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
    }
    
    func configureUpdateCell(forRow rowData: UserData) {
        self.backgroundColor = .red
    }
}
