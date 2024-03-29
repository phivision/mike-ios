//
//  UserContentTrainerInfoCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/7/14.
//

import UIKit
@objc protocol UserContentTrainerInfoCellDelegate{
    @objc optional func favBtnPressed()
    @objc optional func editBtnPressed()
    @objc optional func delBtnPressed()
}
class UserContentTrainerInfoCell: UITableViewCell {
    @IBOutlet weak var avatar:UIButton!
    @IBOutlet weak var userName:UILabel!
    @IBOutlet weak var timeLab:UILabel!
    @IBOutlet weak var titleText:UILabel!
    @IBOutlet weak var descText:UILabel!
    @IBOutlet weak var favBtn:UIButton!
    @IBOutlet weak var delBtn:UIButton!
    @IBOutlet weak var favBtnRightMargin:NSLayoutConstraint!
    weak var delegate:UserContentTrainerInfoCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.avatar.layer.cornerRadius = 20
        self.avatar.clipsToBounds = true
        self.avatar.imageView?.layer.cornerRadius = 10
    }
    func setModel(model:UserCenterTrainer,contentModel:UserCenterContent,isFav:Bool){
        self.userName.text = "\(model.firstName ?? "") \(model.lastName ?? "")"
        self.titleText.text = "\(contentModel.title ?? "")"
        self.descText.text = "\(contentModel.descriptionField ?? "")"
        self.descText.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.descText.numberOfLines = 0
        ImageCacheUtils.sharedTools.imageUrl(key: model.userImage) { imgUrl, cannotLoadUrl in
            if cannotLoadUrl == true{
                self.avatar.setImage(UIImage(named: "logo"), for: .normal)
            }else{
                self.avatar.sd_setImage(with: URL(string: imgUrl  ?? "")!,for: .normal, placeholderImage: UIImage(named: "logo"), options: .refreshCached, completed: nil)
            }
        }
        self.timeLab.text = "\(TimeFormatUtils.timeStrWithDate(dateStr: contentModel.createdAt ?? ""))"
        self.favBtn.isSelected = isFav
        if LoginTools.sharedTools.userId() == model.id{
            self.delBtn.isHidden = false
            self.favBtnRightMargin.constant = 50
        }else{
            self.delBtn.isHidden = true
            self.favBtnRightMargin.constant = 10
        }
    }
    @IBAction func favBtnClicked(){
        self.delegate?.favBtnPressed?()
    }
    @IBAction func delBtnClicked(){
        self.delegate?.delBtnPressed?()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
