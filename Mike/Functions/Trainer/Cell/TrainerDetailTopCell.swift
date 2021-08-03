//
//  TrainerDetailTopCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/7.
//

import UIKit
import Amplify
@objc protocol TrainerDetailTopCellDelegate {
    @objc optional func closeBtnPressed()
    @objc optional func avatarBtnClicked()
}
class TrainerDetailTopCell: UICollectionViewCell {
    @IBOutlet weak var topBg:UIImageView!
    @IBOutlet weak var avatar:UIButton!
    @IBOutlet weak var userName:UILabel!
    @IBOutlet weak var userDesc:UILabel!
    @IBOutlet weak var closeBtn:UIButton!
    var isTrainer:Bool = false
    weak var delegate:TrainerDetailTopCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
    
        // Initialization code
        self.avatar.imageEdgeInsets = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
        self.avatar.imageView!.layer.cornerRadius = 34
        self.avatar.imageView!.clipsToBounds = true
        self.avatar.imageView!.contentMode = .scaleAspectFill
    }
    func setModel(model:UserCenterModel,hiddenCloseBtn:Bool){
        ImageCacheUtils.sharedTools.imageUrl(key: model.userImage) { imgUrl, cannotLoadUrl in
            if cannotLoadUrl == true{
                self.avatar.setImage(UIImage(named: "icon_user_default"), for: .normal)
            }else{
                self.avatar.sd_setImage(with: URL(string: imgUrl  ?? "")!,for:.normal, placeholderImage: UIImage(named: "icon_user_default"), options: .refreshCached, completed: nil)
            }
        }
        self.userName.text = "\(model.firstName ?? "") \(model.lastName ?? "")"
        self.userDesc.text = "\(model.descriptionField ?? "")"
        self.isTrainer = false
        self.closeBtn.isHidden = hiddenCloseBtn
    }
    func clearValue(){
        self.avatar.setImage(UIImage(named: "icon_user_default"), for: .normal)
        self.userName.text = ""
        self.userDesc.text = ""
        self.isTrainer = false
        self.closeBtn.isHidden = true
    }
    @IBAction func closeBtnPressed(){
        self.delegate?.closeBtnPressed?()
    }
    @IBAction func avatarBtnPressed(){
        self.delegate?.avatarBtnClicked?()
    }
}
