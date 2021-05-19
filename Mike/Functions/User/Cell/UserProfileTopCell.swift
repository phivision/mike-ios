//
//  UserProfileTopCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/7.
//

import UIKit
import Amplify
@objc protocol UserProfileTopCellDelegate {
    @objc optional func settingBtnClicked()
    @objc optional func backBtnClicked()
    @objc optional func avatarBtnClicked()
}
class UserProfileTopCell: UICollectionViewCell {
    @IBOutlet weak var topBg:UIImageView!
    @IBOutlet weak var contentBg:UIImageView!
    @IBOutlet weak var avatar:UIImageView!
    @IBOutlet weak var userName:UILabel!
    @IBOutlet weak var userDesc:UILabel!
    @IBOutlet weak var backBtn:UIButton!
    @IBOutlet weak var settingBtn:UIButton!
    var isTrainer:Bool = false
    weak var delegate:UserProfileTopCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
    
        // Initialization code
        let maskPath:UIBezierPath = UIBezierPath(roundedRect: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight), byRoundingCorners: UIRectCorner(rawValue: UIRectCorner.topLeft.rawValue | UIRectCorner.topRight.rawValue), cornerRadii: CGSize.init(width: 20, height: 20))
            let maskLayer:CAShapeLayer = CAShapeLayer()
            maskLayer.frame = self.contentBg.bounds
            maskLayer.path = maskPath.cgPath
            self.contentBg.layer.mask = maskLayer
        self.avatar.layer.cornerRadius = 20
        self.avatar.clipsToBounds = true
    }
    func setModel(model:UserCenterModel,isOtherUser:Bool){
//        Amplify.Storage.getURL(key: model.userImage) { event in
//            switch event {
//            case let .success(url):
//                print("Completed: \(url)")
//                self.avatar.sd_setImage(with: url, placeholderImage: UIImage(named: "logo"), options: .refreshCached, completed: nil)
//            case let .failure(storageError):
//                print("Failed: \(storageError.errorDescription). \(storageError.recoverySuggestion)")
//                self.avatar.image = UIImage(named: "logo")
//            }
//        }
        if isOtherUser == true {
            ImageCacheUtils.sharedTools.imageUrl(key: model.userImage) { imgUrl, cannotLoadUrl in
                if cannotLoadUrl == true{
                    self.avatar.image = UIImage(named: "logo")
                }else{
                    self.avatar.sd_setImage(with: URL(string: imgUrl  ?? "")!, placeholderImage: UIImage(named: "logo"), options: .refreshCached, completed: nil)
                }
            }
            self.userName.text = "\(model.firstName ?? "") \(model.lastName ?? "")"
            self.userDesc.text = "\(model.descriptionField ?? "")"
            self.isTrainer = false
            self.configBtn(showBack: isOtherUser)
        }else{
            ImageCacheUtils.sharedTools.imageUrl(key: LoginTools.sharedTools.userInfo().userImage) { imgUrl, cannotLoadUrl in
                if cannotLoadUrl == true{
                    self.avatar.image = UIImage(named: "logo")
                }else{
                    self.avatar.sd_setImage(with: URL(string: imgUrl  ?? "")!, placeholderImage: UIImage(named: "logo"), options: .refreshCached, completed: nil)
                }
            }
            self.userName.text = "\(LoginTools.sharedTools.userInfo().firstName ?? "") \(LoginTools.sharedTools.userInfo().lastName ?? "")"
            self.userDesc.text = "\(LoginTools.sharedTools.userInfo().descriptionField ?? "")"
            self.isTrainer = false
            self.configBtn(showBack: isOtherUser)
        }
    }
    func setTrainerModel(model:TrainerDetailModel){
        ImageCacheUtils.sharedTools.imageUrl(key: model.userImage) { imgUrl, cannotLoadUrl in
            if cannotLoadUrl == true{
                self.avatar.image = UIImage(named: "logo")
            }else{
                self.avatar.sd_setImage(with: URL(string: imgUrl  ?? "")!, placeholderImage: UIImage(named: "logo"), options: .refreshCached, completed: nil)
            }
        }
        self.userName.text = "\(model.firstName ?? "") \(model.lastName ?? "")"
        self.userDesc.text = "\(model.descriptionField ?? "")"
        self.isTrainer = true
        self.configBtn(showBack: true)
    }
    func configBtn(showBack:Bool){
        if showBack == true {
            self.settingBtn.isHidden = true
            self.backBtn.isHidden = false
        }else{
            self.settingBtn.isHidden = false
            self.backBtn.isHidden = true
        }
    }
    @IBAction func settingBtnPressed(){
        self.delegate?.settingBtnClicked?()
    }
    @IBAction func backBtnPressed(){
        self.delegate?.backBtnClicked?()
    }
    @IBAction func avatarBtnPressed(){
        self.delegate?.avatarBtnClicked?()
    }
}
