//
//  UserSettingTrainerListCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/7/15.
//

import UIKit
@objc protocol UserSettingTrainerListCellDelegate{
    @objc optional func delSubscriptionTrainer(index:IndexPath)
}
class UserSettingTrainerListCell: UITableViewCell {
    @IBOutlet weak var nameLab:UILabel!
    @IBOutlet weak var subLab:UILabel!
    @IBOutlet weak var deleteBtn: UIButton!
    var index:IndexPath!
    var cancelAtPeriodEnd:Bool!
    weak var delegate:UserSettingTrainerListCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setModel(model:UserCenterTrainer,index:IndexPath) {
        self.index = index
        self.nameLab.text = "\(model.firstName ?? "") \(model.lastName ?? "")"
        let expire = AgeUtils.transDate(oldFormat: "yyyy-MM-dd", newFormat: "MMM dd", dateValue: model.expireDate)
        self.cancelAtPeriodEnd = model.cancelAtPeriodEnd
        if self.cancelAtPeriodEnd == true {
            deleteBtn.isHidden = true
        }
        self.subLab.text = model.cancelAtPeriodEnd ? "Expires on \(expire)" : "Renews on \(expire)"
    }
    @IBAction func delBtnPressed(){
        self.delegate?.delSubscriptionTrainer?(index: self.index)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
