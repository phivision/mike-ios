//
//  TrainerTabListCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/7/16.
//

import UIKit

class TrainerTabListCell: UITableViewCell {
    @IBOutlet weak var avatarImg:UIButton!
    @IBOutlet weak var nameLab:UILabel!
    @IBOutlet weak var dotImg:UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.avatarImg.imageView?.layer.cornerRadius = 17.5
        self.avatarImg.imageView?.clipsToBounds = true
        self.avatarImg.layer.cornerRadius = 55.0/2
        self.avatarImg.layer.borderWidth = 2
        self.dotImg.layer.cornerRadius = 5
        
    }
    func setModel(model:UserCenterTrainer){
        self.nameLab.text = "\(model.firstName ?? "") \(model.lastName ?? "")"
        ImageCacheUtils.sharedTools.imageUrl(key: model.userImage) { imgUrl, cannotLoadUrl in
            if cannotLoadUrl == true{
                self.avatarImg.setImage(UIImage(named: "icon_user_default"), for: .normal)
            }else{
                self.avatarImg.sd_setImage(with: URL(string: imgUrl  ?? "")!, for:.normal,placeholderImage: UIImage(named: "icon_user_default"), options: .refreshCached, completed: nil)
            }
        }
        if model.id == LoginTools.sharedTools.trainerModel?.id {
            self.avatarImg.layer.borderColor = orangeColor.cgColor
            self.dotImg.isHidden = false
        }else{
            self.avatarImg.layer.borderColor = UIColor.clear.cgColor
            self.dotImg.isHidden = true
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
