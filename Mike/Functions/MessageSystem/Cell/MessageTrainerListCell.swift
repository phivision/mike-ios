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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setTrainerModel(model:UserCenterTrainer){
        if let lastMsg = UserDefaults.standard.object(forKey: "lastMsg_\(model.id ?? "")") {
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
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
