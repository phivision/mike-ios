//
//  TrainerSubscribeActionCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/7/15.
//

import UIKit
@objc protocol TrainerSubscribeActionCellDelegate{
    @objc func messageMeBtnClicked()
    @objc func subscribeBtnClicked()
}
class TrainerSubscribeActionCell: UICollectionViewCell {
    @IBOutlet weak var subscribeBtn:UIButton!
    @IBOutlet weak var messageBtn:UIButton!
    @IBOutlet weak var priceLab:UILabel!
    @IBOutlet weak var iconCoin:UIImageView!
    @IBOutlet weak var subscribeBtnWidthRatio:NSLayoutConstraint!
    @IBOutlet weak var messageBtnWidthRatio:NSLayoutConstraint!
    weak var delegate:TrainerSubscribeActionCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.subscribeBtn.layer.cornerRadius = 6
        self.messageBtn.layer.cornerRadius = 6
        self.messageBtn.isHidden = true
        self.subscribeBtn.isHidden = true
        self.iconCoin.isHidden = true
    }
    func setModel(model:UserCenterModel,isSubscribed:Bool){
        if isSubscribed == true {
            self.subscribeBtnWidthRatio.constant = -25
            self.messageBtnWidthRatio.constant = -25
            self.subscribeBtn.setTitle("Subscribed", for: .normal)
            self.priceLab.isHidden = true
            self.iconCoin.isHidden = true
            self.messageBtn.setTitle("Message Me", for: .normal)
            self.subscribeBtn.layer.borderWidth = 1
            self.subscribeBtn.layer.borderColor = UIColor.black.cgColor
            self.subscribeBtn.setTitleColor(UIColor.black, for: .normal)
            self.subscribeBtn.backgroundColor = UIColor.white
            self.messageBtn.backgroundColor = orangeColor
            self.messageBtn.setTitleColor(UIColor.white, for: .normal)
            self.messageBtn.layer.borderWidth = 1
            self.messageBtn.layer.borderColor = orangeColor.cgColor
            self.messageBtn.isHidden = false
        }else{
            self.subscribeBtnWidthRatio.constant = 0
            self.messageBtnWidthRatio.constant = -50
            self.subscribeBtn.setTitle("", for: .normal)
            self.priceLab.text = "Subscribe for \(model.SubscriptionPrice ?? 0)"
            self.priceLab.isHidden = false
            self.iconCoin.isHidden = false
            self.messageBtn.setTitle("Message Me", for: .normal)
            self.messageBtn.layer.borderWidth = 1
            self.messageBtn.layer.borderColor = UIColor.black.cgColor
            self.messageBtn.setTitleColor(UIColor.black, for: .normal)
            self.messageBtn.backgroundColor = UIColor.white
            self.subscribeBtn.backgroundColor = orangeColor
            self.subscribeBtn.setTitleColor(UIColor.white, for: .normal)
            self.messageBtn.isHidden = false
        }
//        self.messageBtn.isHidden = false
        self.subscribeBtn.isHidden = false
    }
    @IBAction func messageMe(){
        self.delegate?.messageMeBtnClicked()
    }
    @IBAction func subscribe(){
        self.delegate?.subscribeBtnClicked()
    }
}
