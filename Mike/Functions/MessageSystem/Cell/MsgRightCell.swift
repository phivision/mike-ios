//
//  MsgRightCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/6/22.
//

import UIKit

class MsgRightCell: UITableViewCell {
    @IBOutlet weak var msgContentBg:UIImageView!
    @IBOutlet weak var msgContentLab:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.msgContentBg.clipsToBounds = false
        self.msgContentBg.layer.cornerRadius = 10
    }

    func setMsgModel(model:MessageListModel){
        self.msgContentLab.text = "\(model.postMessages ?? "")"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
