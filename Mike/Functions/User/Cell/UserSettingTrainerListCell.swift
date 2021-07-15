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
    var index:IndexPath!
    weak var delegate:UserSettingTrainerListCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setModel(model:UserCenterTrainer,index:IndexPath) {
        self.index = index
        self.nameLab.text = "\(model.firstName ?? "") \(model.lastName ?? "")"
        self.subLab.text = "Renews on \(TimeFormatUtils.timeStrWithDate(dateStr: model.updatedAt))"
    }
    @IBAction func delBtnPressed(){
        self.delegate?.delSubscriptionTrainer?(index: self.index)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
