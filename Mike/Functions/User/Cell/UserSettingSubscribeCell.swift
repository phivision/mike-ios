//
//  UserSettingSubscribeCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/7/15.
//

import UIKit

class UserSettingSubscribeCell: UITableViewCell {
    @IBOutlet weak var subscriptionPriceBg:UIImageView!
    @IBOutlet weak var perMessagePriceBg:UIImageView!
    @IBOutlet weak var subscriptionPrice:UILabel!
    @IBOutlet weak var perMessagePrice:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.subscriptionPriceBg.layer.cornerRadius = 5
        self.subscriptionPriceBg.layer.borderWidth = 1
        self.subscriptionPriceBg.layer.borderColor = lightGreyColor.cgColor
        self.perMessagePriceBg.layer.cornerRadius = 5
        self.perMessagePriceBg.layer.borderWidth = 1
        self.perMessagePriceBg.layer.borderColor = lightGreyColor.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
