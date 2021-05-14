//
//  HomeListCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/5.
//

import UIKit
import Amplify

class HomeListCell: UITableViewCell {
    @IBOutlet weak var contentBg:UIImageView!
    @IBOutlet weak var avatar:UIImageView!
    @IBOutlet weak var contentImg:UIImageView!
    @IBOutlet weak var descText:UILabel!
    @IBOutlet weak var userName:UILabel!
    @IBOutlet weak var timeLab:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentBg.clipsToBounds = false
        self.contentBg.layer.cornerRadius = 15
        self.contentBg.layer.shadowColor = HexRGBAlpha(0xffe2e7f6,1).cgColor
        self.contentBg.layer.shadowOffset = CGSize(width: 10, height: 10)
        self.contentBg.layer.shadowOpacity = 2
        self.contentBg.layer.shadowRadius = 20
        
        self.contentImg.layer.cornerRadius = 15
        self.contentImg.clipsToBounds = true
        
        self.avatar.layer.cornerRadius = 15
        self.avatar.clipsToBounds = true
    }
    
    func setItemModel(model:UserSubscriptionTrainerListItem,sectionModel:UserSubscriptionTrainerListTrainer){
        self.userName.text = "\(sectionModel.firstName ?? "") \(sectionModel.lastName ?? "")"
        self.descText.text = "\(model.descriptionField ?? "")"
        ImageCacheUtils.sharedTools.imageUrl(key: sectionModel.userImage) { imgUrl, cannotLoadUrl in
            if cannotLoadUrl == true{
                self.avatar.image = UIImage(named: "logo")
            }else{
                self.avatar.sd_setImage(with: URL(string: imgUrl  ?? "")!, placeholderImage: UIImage(named: "logo"), options: .refreshCached, completed: nil)
            }
        }
        ImageCacheUtils.sharedTools.imageUrl(key: model.thumbnail) { imgUrl, cannotLoadUrl in
            if cannotLoadUrl == true{
                self.contentImg.image = UIImage(named: "logo")
            }else{
                self.contentImg.sd_setImage(with: URL(string: imgUrl  ?? "")!, placeholderImage: UIImage(named: "logo"), options: .refreshCached, completed: nil)
            }
        }
//        Amplify.Storage.getURL(key: sectionModel.userImage) { event in
//            switch event {
//            case let .success(url):
//                print("Completed: \(url)")
//                self.avatar.sd_setImage(with: url, placeholderImage: UIImage(named: "logo"), options: .refreshCached, completed: nil)
//            case let .failure(storageError):
//                print("Failed: \(storageError.errorDescription). \(storageError.recoverySuggestion)")
//                self.avatar.image = UIImage(named: "logo")
//            }
//        }
//        if StringUtils.isBlank(value: model.thumbnail) {
//            self.contentImg.image = UIImage(named: "logo")
//        }else{
//            Amplify.Storage.getURL(key: model.thumbnail) { event in
//                switch event {
//                case let .success(url):
//                    print("Completed: \(url)")
//                    self.contentImg.sd_setImage(with: url, placeholderImage: UIImage(named: "logo"), options: .refreshCached, completed: nil)
//                case let .failure(storageError):
//                    print("Failed: \(storageError.errorDescription). \(storageError.recoverySuggestion)")
//                    self.contentImg.image = UIImage(named: "logo")
//                }
//            }
//        }
        self.timeLab.text = "\(TimeFormatUtils.timeStrWithDate(dateStr: model.createdAt))"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
