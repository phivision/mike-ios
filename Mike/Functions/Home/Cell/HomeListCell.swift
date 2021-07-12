//
//  HomeListCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/5.
//

import UIKit
import Amplify
@objc protocol HomeListCellDelegate{
    @objc optional func homeListAvatarClicked(model:UserSubscriptionTrainerListTrainer)
}
class HomeListCell: UITableViewCell {
    @IBOutlet weak var contentBg:UIImageView!
    @IBOutlet weak var avatar:UIButton!
    @IBOutlet weak var contentImg:UIImageView!
    @IBOutlet weak var titleText:UILabel!
    @IBOutlet weak var descText:UILabel!
    @IBOutlet weak var userName:UILabel!
    @IBOutlet weak var timeLab:UILabel!
    @IBOutlet weak var transcodeBlurView:UIToolbar!
    @IBOutlet weak var transcodeStatus:UILabel!
    weak var delegate:HomeListCellDelegate?
    var curModel:UserSubscriptionTrainerListTrainer!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.avatar.layer.cornerRadius = 20
        self.avatar.clipsToBounds = true
        self.avatar.imageView?.layer.cornerRadius = 10
    
        self.transcodeBlurView.items = []
    }
    
    func setItemModel(model:UserSubscriptionTrainerListItem,sectionModel:UserSubscriptionTrainerListTrainer){
        self.curModel = sectionModel
        self.userName.text = "\(sectionModel.firstName ?? "") \(sectionModel.lastName ?? "")"
        self.titleText.text = "\(model.title ?? "")"
        self.descText.text = "\(model.descriptionField ?? "")"
        ImageCacheUtils.sharedTools.imageUrl(key: sectionModel.userImage) { imgUrl, cannotLoadUrl in
            if cannotLoadUrl == true{
                self.avatar.setImage(UIImage(named: "logo"), for: .normal)
            }else{
                self.avatar.sd_setImage(with: URL(string: imgUrl  ?? "")!,for: .normal, placeholderImage: UIImage(named: "logo"), options: .refreshCached, completed: nil)
            }
        }
        ImageCacheUtils.sharedTools.imageUrl(key: model.thumbnail) { imgUrl, cannotLoadUrl in
            if cannotLoadUrl == true{
                self.contentImg.image = UIImage(named: "logo")
            }else{
                self.contentImg.sd_setImage(with: URL(string: imgUrl  ?? "")!, placeholderImage: UIImage(named: "logo"), options: .refreshCached, completed: nil)
            }
        }
        self.timeLab.text = "\(TimeFormatUtils.timeStrWithDate(dateStr: model.createdAt))"
        if model.TranscodeReady == true || model.TranscodeReady == nil{
            self.transcodeBlurView.isHidden = true
            self.transcodeStatus.isHidden = true
        }else{
            self.transcodeBlurView.isHidden = false
            self.transcodeStatus.isHidden = false
        }
    }
    
    @IBAction func avatarClicked(){
        self.delegate?.homeListAvatarClicked?(model: self.curModel)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
