//
//  FeedOrFavColListCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/7/13.
//

import UIKit

class FeedOrFavColListCell: UICollectionViewCell {
    @IBOutlet weak var mainImage:UIImageView!
    @IBOutlet weak var titleLab:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setModel(model:UserCenterContent){
        self.titleLab.text = "\(model.title ?? "")"
        ImageCacheUtils.sharedTools.imageUrl(key: model.thumbnail) { imgUrl, cannotLoadUrl in
            if cannotLoadUrl == true{
                self.mainImage.image = UIImage(named: "logo")
            }else{
                self.mainImage.sd_setImage(with: URL(string: imgUrl  ?? "")!, placeholderImage: UIImage(named: "logo"), options: .refreshCached, completed: nil)
            }
        }
    }
}
