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
        self.avatarImg.layer.cornerRadius = 10
        self.avatarImg.clipsToBounds = true
    }
    func setTrainerModel(model:UserCenterTrainer){
        if let lastMsg = UserDefaults.standard.object(forKey: "\(lastMsgForStudent)\(model.id ?? "")") {
            self.lastMsgContentLab.text = "\(lastMsg)"
        }else{
            self.lastMsgContentLab.text = "No records!"
        }
        self.nameLab.text = "\(model.firstName ?? "") \(model.lastName ?? "")"
        ImageCacheUtils.sharedTools.imageUrl(key: model.userImage) { imgUrl, cannotLoadUrl in
            if cannotLoadUrl == true{
                self.avatarImg.image = UIImage(named: "logo")
            }else{
                self.avatarImg.sd_setImage(with: URL(string: imgUrl  ?? "")!, placeholderImage: UIImage(named: "logo"), options: .refreshCached, completed: nil)
            }
        }
        let result = UserDefaults.standard.bool(forKey: "\(msgForStudentUnRead)\(model.id ?? "")")
        print("trainer~~~~~~~~~~~~~~~~~~~~~~~~~\(result)")
        self.dotImg.isHidden = !result
    }
    func setStudentModel(model:UserCenterTrainer){
        if let lastMsg = UserDefaults.standard.object(forKey: "\(lastMsgForTrainer)\(model.id ?? "")") {
            self.lastMsgContentLab.text = "\(lastMsg)"
        }else{
            self.lastMsgContentLab.text = "No records!"
        }
        self.nameLab.text = "\(model.firstName ?? "") \(model.lastName ?? "")"
        ImageCacheUtils.sharedTools.imageUrl(key: model.userImage) { imgUrl, cannotLoadUrl in
            if cannotLoadUrl == true{
                self.avatarImg.image = UIImage(named: "logo")
            }else{
                self.avatarImg.sd_setImage(with: URL(string: imgUrl  ?? "")!, placeholderImage: UIImage(named: "logo"), options: .refreshCached, completed: nil)
            }
        }
        let result = UserDefaults.standard.bool(forKey: "\(msgForTrainerUnRead)\(model.id ?? "")")
        print("trainer~~~~~~~~~~~~~~~~~~~~~~~~~\(result)")
        self.dotImg.isHidden = !result
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
