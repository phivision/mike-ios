//
//  TrainerMessageMeCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/7/15.
//

import UIKit

class TrainerMessageMeCell: UITableViewCell {
    @IBOutlet weak var subscribeBtn:UIButton!
    @IBOutlet weak var messageBtn:UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.subscribeBtn.layer.cornerRadius = 6
        self.messageBtn.layer.cornerRadius = 6
    }
    func setModel(model:UserCenterModel,isSubscribed:Bool){
        if isSubscribed == true {
            self.subscribeBtn.setTitle("Subscribed", for: .normal)
            self.messageBtn.setTitle("Message Me", for: .normal)
            self.subscribeBtn.layer.borderWidth = 1
            self.subscribeBtn.layer.borderColor = UIColor.black.cgColor
            self.subscribeBtn.setTitleColor(UIColor.black, for: .normal)
            self.subscribeBtn.backgroundColor = UIColor.white
            self.messageBtn.backgroundColor = orangeColor
            self.messageBtn.setTitleColor(UIColor.white, for: .normal)
        }else{
            self.subscribeBtn.setTitle("Subscribe for $\(model.TokenPrice ?? 0)", for: .normal)
            self.messageBtn.setTitle("Message Me", for: .normal)
            self.messageBtn.layer.borderWidth = 1
            self.messageBtn.layer.borderColor = UIColor.black.cgColor
            self.messageBtn.setTitleColor(UIColor.black, for: .normal)
            self.messageBtn.backgroundColor = UIColor.white
            self.subscribeBtn.backgroundColor = orangeColor
            self.subscribeBtn.setTitleColor(UIColor.white, for: .normal)
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
