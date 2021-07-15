//
//  SearchResultListCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/7/12.
//

import UIKit

class SearchResultListCell: UITableViewCell {
    @IBOutlet weak var avatarImg:UIButton!
    @IBOutlet weak var nameLab:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.avatarImg.imageView?.layer.cornerRadius = 17.5
        self.avatarImg.imageView?.clipsToBounds = true
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
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
