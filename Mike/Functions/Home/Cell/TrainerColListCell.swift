//
//  TrainerColListCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/7/12.
//

import UIKit

class TrainerColListCell: UICollectionViewCell {
    @IBOutlet weak var trainerAvatar:UIImageView!
    @IBOutlet weak var trainerName:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.trainerAvatar.layer.cornerRadius = 34
        self.trainerAvatar.clipsToBounds = true
    }
    func setModel(model:UserSubscriptionTrainerListModel){
        self.trainerName.text = "\(model.trainer.firstName ?? "") \(model.trainer.lastName ?? "")"
        ImageCacheUtils.sharedTools.imageUrl(key: model.trainer.userImage) { imgUrl, cannotLoadUrl in
            if cannotLoadUrl == true{
                self.trainerAvatar.image = UIImage(named: "logo")
            }else{
                self.trainerAvatar.sd_setImage(with: URL(string: imgUrl  ?? "")!, placeholderImage: UIImage(named: "logo"), options: .refreshCached, completed: nil)
            }
        }
    }
}
