//
//  HomeListCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/5.
//

import UIKit
import Amplify
class TrainerContentListCell: UITableViewCell {
    @IBOutlet weak var contentBg:UIImageView!
    @IBOutlet weak var avatar:UIButton!
    @IBOutlet weak var contentImg:UIImageView!
    @IBOutlet weak var titleText:UILabel!
    @IBOutlet weak var descText:UILabel!
    @IBOutlet weak var userName:UILabel!
    @IBOutlet weak var timeLab:UILabel!
    @IBOutlet weak var transcodeBlurView:UIToolbar!
    @IBOutlet weak var transcodeStatus:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.transcodeBlurView.items = []
        
        self.avatar.layer.cornerRadius = 20
        self.avatar.clipsToBounds = true
        self.avatar.imageView?.layer.cornerRadius = 10
    }
    func setContentModel(model:UserCenterContent){
        self.userName.text = "\(LoginTools.sharedTools.userInfo().firstName ?? "") \(LoginTools.sharedTools.userInfo().lastName ?? "")"
        self.descText.text = "\(model.descriptionField ?? "")"
        self.titleText.text = "\(model.title ?? "")"
        ImageCacheUtils.sharedTools.imageUrl(key: LoginTools.sharedTools.userInfo().userImage) { imgUrl, cannotLoadUrl in
            DispatchQueue.main.async {
                if cannotLoadUrl == true{
                    self.avatar.setImage(UIImage(named: "logo"), for: .normal)
                }else{
                    self.avatar.sd_setImage(with: URL(string: imgUrl  ?? "")!,for: .normal, placeholderImage: UIImage(named: "logo"), options: .refreshCached, completed: nil)
                }
            }
        }
        ImageCacheUtils.sharedTools.imageUrl(key: model.thumbnail) { imgUrl, cannotLoadUrl in
            DispatchQueue.main.async {
                if cannotLoadUrl == true{
                    self.contentImg.image = UIImage(named: "logo")
                }else{
                    self.contentImg.sd_setImage(with: URL(string: imgUrl  ?? "")!, placeholderImage: UIImage(named: "logo"), options: .retryFailed, completed: nil)
                }
            }
        }
        self.timeLab.text = "\(TimeFormatUtils.timeStrWithDate(dateStr: model.createdAt ?? ""))"
        if model.transcodeReady == true || model.transcodeReady == nil{
            self.transcodeBlurView.isHidden = true
            self.transcodeStatus.isHidden = true
        }else{
            self.transcodeBlurView.isHidden = false
            self.transcodeStatus.isHidden = false
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
