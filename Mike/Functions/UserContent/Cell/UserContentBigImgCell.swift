//
//  UserContentBigImgCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/7/14.
//

import UIKit

class UserContentBigImgCell: UITableViewCell {
    @IBOutlet weak var mainImage:UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setModel(model:UserCenterContent){
        ImageCacheUtils.sharedTools.imageUrl(key: model.thumbnail) { imgUrl, cannotLoadUrl in
            if cannotLoadUrl == true{
                self.mainImage.image = UIImage(named: "logo")
            }else{
                self.mainImage.sd_setImage(with: URL(string: imgUrl  ?? "")!, placeholderImage: UIImage(named: "logo"), options: .refreshCached, completed: nil)
            }
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
