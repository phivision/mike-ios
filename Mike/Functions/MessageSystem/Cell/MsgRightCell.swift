//
//  MsgRightCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/6/22.
//

import UIKit

class MsgRightCell: UITableViewCell {
    @IBOutlet weak var userImage:UIImageView!
    @IBOutlet weak var msgContentBg:UIImageView!
    @IBOutlet weak var msgContentLab:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.msgContentBg.clipsToBounds = false
        self.msgContentBg.layer.cornerRadius = 15
        self.msgContentBg.layer.shadowColor = HexRGBAlpha(0xffe2e7f6,1).cgColor
        self.msgContentBg.layer.shadowOffset = CGSize(width: 10, height: 10)
        self.msgContentBg.layer.shadowOpacity = 2
        self.msgContentBg.layer.shadowRadius = 20
    }

    func setMsgModel(model:MessageListModel){
        self.msgContentLab.text = "\(model.postMessages ?? "")"
        ImageCacheUtils.sharedTools.imageUrl(key: model.fromUser.userImage) { imgUrl, cannotLoadUrl in
            if cannotLoadUrl == true{
                self.userImage.image = UIImage(named: "logo")
            }else{
                self.userImage.sd_setImage(with: URL(string: imgUrl  ?? "")!, placeholderImage: UIImage(named: "logo"), options: .refreshCached, completed: nil)
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
