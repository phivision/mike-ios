//
//  UserContentDetailTopTabCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/9.
//

import UIKit
import Amplify
class UserContentDetailTopTabCell: UITableViewCell {
    @IBOutlet weak var backImg:UIImageView!
    @IBOutlet weak var bgImg:UIImageView!
    @IBOutlet weak var bigImg:UIImageView!
    @IBOutlet weak var titleLab:UILabel!
    @IBOutlet weak var timeLab:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.bgImg.clipsToBounds = false
        self.bgImg.layer.cornerRadius = 15
        self.bgImg.layer.shadowColor = HexRGBAlpha(0xff7088D2,0.2).cgColor
        self.bgImg.layer.shadowOffset = CGSize(width: 5, height: 8)
        self.bgImg.layer.shadowOpacity = 0.5
        
        self.bigImg.layer.cornerRadius = 20
        self.bigImg.clipsToBounds = true
    }
    func setFavModel(favModel:UserCenterContent,segListCount:Int){
        self.titleLab.text = "\(favModel.title ?? "")"
        self.timeLab.text = "\(TimeFormatUtils.timeStrWithDate(dateStr: favModel.createdAt ?? ""))"
        ImageCacheUtils.sharedTools.imageUrl(key: favModel.thumbnail) { imgUrl, cannotLoadUrl in
            if cannotLoadUrl == true{
                self.bigImg.image = UIImage(named: "logo")
            }else{
                self.bigImg.sd_setImage(with: URL(string: imgUrl  ?? "")!, placeholderImage: UIImage(named: "logo"), options: .refreshCached, completed: nil)
            }
        }
        if segListCount == 0{
            self.backImg.clipsToBounds = false
            self.backImg.layer.cornerRadius = 15
            self.backImg.layer.shadowColor = HexRGBAlpha(0xff7088D2,0.2).cgColor
            self.backImg.layer.shadowOffset = CGSize(width: 0, height: 4)
            self.backImg.layer.shadowOpacity = 4
            self.backImg.layer.shadowRadius = 6
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
