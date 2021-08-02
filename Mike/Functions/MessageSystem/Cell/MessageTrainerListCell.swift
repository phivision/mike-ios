//
//  MessageTrainerListCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/6/22.
//

import UIKit

class MessageTrainerListCell: UITableViewCell {
    @IBOutlet weak var avatarImg:UIImageView!
    @IBOutlet weak var nameLab:UILabel!
    @IBOutlet weak var lastMsgContentLab:UILabel!
    @IBOutlet weak var dotImg:UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.dotImg.layer.cornerRadius = 5
        self.dotImg.clipsToBounds = true
        self.avatarImg.layer.cornerRadius = 25
        self.avatarImg.clipsToBounds = true
    }
    func setModelForStudent(model:UserCenterTrainer){
        if let lastMsg = UserDefaults.standard.object(forKey: "\(message_lastMsgForStudent)\(model.id ?? "")") {
            self.lastMsgContentLab.text = "\(lastMsg)"
        }else{
            self.lastMsgContentLab.text = "No messages yet"
        }
        self.nameLab.text = "\(model.firstName ?? "") \(model.lastName ?? "")"
        ImageCacheUtils.sharedTools.imageUrl(key: model.userImage) { imgUrl, cannotLoadUrl in
            if cannotLoadUrl == true{
                self.avatarImg.image = UIImage(named: "icon_user_default")
            }else{
                self.avatarImg.sd_setImage(with: URL(string: imgUrl  ?? "")!, placeholderImage: UIImage(named: "icon_user_default"), options: .refreshCached, completed: nil)
            }
        }
        let result = UserDefaults.standard.bool(forKey: "\(message_msgForStudentUnRead)\(model.id ?? "")")
        print("trainer~~~~~~~~~~~~~~~~~~~~~~~~~\(result)")
        self.dotImg.isHidden = !result
    }
    func setModelForTrainer(model:UserCenterTrainer){
        if let lastMsg = UserDefaults.standard.object(forKey: "\(message_lastMsgForTrainer)\(model.id ?? "")") {
            self.lastMsgContentLab.text = "\(lastMsg)"
        }else{
            self.lastMsgContentLab.text = "No messages yet"
        }
        self.nameLab.text = "\(model.firstName ?? "") \(model.lastName ?? "")"
        ImageCacheUtils.sharedTools.imageUrl(key: model.userImage) { imgUrl, cannotLoadUrl in
            if cannotLoadUrl == true{
                self.avatarImg.image = UIImage(named: "icon_user_default")
            }else{
                self.avatarImg.sd_setImage(with: URL(string: imgUrl  ?? "")!, placeholderImage: UIImage(named: "logo"), options: .refreshCached, completed: nil)
            }
        }
        let result = UserDefaults.standard.bool(forKey: "\(message_msgForTrainerUnRead)\(model.id ?? "")")
        print("trainer~~~~~~~~~~~~~~~~~~~~~~~~~\(result)")
        self.dotImg.isHidden = !result
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
