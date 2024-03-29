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
    @objc optional func editBtnPressed()
    @objc optional func avatarBtnClicked()
}
class UserProfileTopCell: UICollectionViewCell {
    @IBOutlet weak var topBg:UIImageView!
    @IBOutlet weak var avatar:UIButton!
    @IBOutlet weak var userName:UILabel!
    @IBOutlet weak var userDesc:UILabel!
    @IBOutlet weak var editBtn:UIButton!
    @IBOutlet weak var settingBtn:UIButton!
    var isTrainer:Bool = false
    weak var delegate:UserProfileTopCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
    
        // Initialization code
        self.avatar.imageEdgeInsets = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
        self.avatar.imageView!.layer.cornerRadius = 34
        self.avatar.imageView!.clipsToBounds = true
    }
    func setModel(model:UserCenterModel,isOtherUser:Bool){
        if isOtherUser == true {
            ImageCacheUtils.sharedTools.imageUrl(key: model.userImage) { imgUrl, cannotLoadUrl in
                if cannotLoadUrl == true{
                    self.avatar.setImage(UIImage(named: "icon_user_default"), for: .normal)
                }else{
                    self.avatar.sd_setImage(with: URL(string: imgUrl  ?? "")!,for:.normal, placeholderImage: UIImage(named: "icon_user_default"), options: .refreshCached, completed: nil)
                }
            }
            self.userName.text = "\(model.firstName ?? "") \(model.lastName ?? "")"
            let dateStr = AgeUtils.transDate(oldFormat: "yyyy-MM-dd", newFormat: "MMM dd", dateValue: model.regDate)
            self.userDesc.text = "Joined \(dateStr)"
            self.userDesc.lineBreakMode = NSLineBreakMode.byWordWrapping
            self.isTrainer = false
        }else{
            ImageCacheUtils.sharedTools.imageUrl(key: LoginTools.sharedTools.userInfo().userImage) { imgUrl, cannotLoadUrl in
                if cannotLoadUrl == true{
                    self.avatar.setImage(UIImage(named: "icon_user_default"), for: .normal)
                }else{
                    self.avatar.sd_setImage(with: URL(string: imgUrl  ?? "")!,for:.normal, placeholderImage: UIImage(named: "icon_user_default"), options: .refreshCached, completed: nil)
                }
            }
            var regDate: String = "";
            if let tempDate = LoginTools.sharedTools.userInfo().regDate {
                let firstIndex = tempDate.index(after: tempDate.firstIndex(of: "-")!)
                let lastIndex = tempDate.lastIndex(of: "-")!
                
                let monthNumber = Int(tempDate[firstIndex..<lastIndex])
                let monthName = DateFormatter().monthSymbols[monthNumber! - 1]
            
                let year = tempDate[..<tempDate.firstIndex(of: "-")!]
                
                regDate += monthName + " " + year
            }
            self.userName.text = "\(LoginTools.sharedTools.userInfo().firstName ?? "") \(LoginTools.sharedTools.userInfo().lastName ?? "")"
//            self.userDesc.text = "Joined \(LoginTools.sharedTools.userInfo().regDate ?? "")"
            let dateStr = AgeUtils.transDate(oldFormat: "yyyy-MM-dd", newFormat: "MMM dd", dateValue: model.regDate)
            self.userDesc.text = "Joined \(dateStr)"
            self.isTrainer = false
        }
    }
    func setTrainerModel(model:UserCenterModel){
        ImageCacheUtils.sharedTools.imageUrl(key: model.userImage) { imgUrl, cannotLoadUrl in
            if cannotLoadUrl == true{
                self.avatar.setImage(UIImage(named: "icon_user_default"), for: .normal)
            }else{
                self.avatar.sd_setImage(with: URL(string: imgUrl  ?? "")!,for:.normal, placeholderImage: UIImage(named: "icon_user_default"), options: .refreshCached, completed: nil)
            }
        }
        self.userName.text = "\(model.firstName ?? "") \(model.lastName ?? "")"
        self.userDesc.text = "\(model.descriptionField ?? "")"
        self.isTrainer = true
    }
    @IBAction func settingBtnPressed(){
        self.delegate?.settingBtnClicked?()
    }
    @IBAction func editBtnPressed(){
        self.delegate?.editBtnPressed?()
    }
    @IBAction func avatarBtnPressed(){
        self.delegate?.avatarBtnClicked?()
    }
}
