//
//  UserTableCell.swift
//  GSSqliteGlobal
//
//  Created by iGatiTech on 07/02/20.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import UIKit

class UserTableCell: UITableViewCell {
    //MARK:- IBOutlets
    @IBOutlet weak var labelFullName : UILabel!
    @IBOutlet weak var labelEmail : UILabel!
    
    //MARK:- Variables
    var userData : UserData? {
        didSet {
            setUpData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK:- Custom Methods
    func setUpData() {
        labelFullName.text = "\(userData?.firstname ?? StringConstant.Common.unknown) \(userData?.lastname ?? "")"
        labelEmail.text = userData?.email ?? ""
    }
}
