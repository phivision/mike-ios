//
//  UserProfileModeChangeColCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/7/13.
//

import UIKit
@objc protocol UserProfileModeChangeColCellDelegate{
    @objc func listModeChanged(isFeedMode:Bool)
}
class UserProfileModeChangeColCell: UICollectionViewCell {
    @IBOutlet weak var feedBtn:UIButton!
    @IBOutlet weak var favBtn:UIButton!
    weak var delegate:UserProfileModeChangeColCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.feedBtn.layer.borderWidth = 1
        self.feedBtn.layer.borderColor = UIColor.black.cgColor
        self.feedBtn.layer.cornerRadius = 25
        self.favBtn.layer.borderWidth = 1
        self.favBtn.layer.borderColor = UIColor.black.cgColor
        self.favBtn.layer.cornerRadius = 25
        self.feedBtn.isSelected = true
        self.favBtn.isSelected = false
        self.configButtons()
    }
    func setModel(isFeedMode:Bool){
        if isFeedMode == true {
            self.feedBtn.isSelected = true
            self.favBtn.isSelected = false
        }else{
            self.feedBtn.isSelected = false
            self.favBtn.isSelected = true
        }
        self.configButtons()
    }
    func configButtons(){
        if self.feedBtn.isSelected {
            self.feedBtn.backgroundColor = UIColor.black
            self.favBtn.backgroundColor = UIColor.white
        }else{
            self.feedBtn.backgroundColor = UIColor.white
            self.favBtn.backgroundColor = UIColor.black
        }
    }
    @IBAction func feedBtnPressed(){
        self.feedBtn.isSelected = true
        self.favBtn.isSelected = false
        self.configButtons()
        self.delegate?.listModeChanged(isFeedMode: self.feedBtn.isSelected)
    }
    @IBAction func favBtnPressed(){
        self.feedBtn.isSelected = false
        self.favBtn.isSelected = true
        self.configButtons()
        self.delegate?.listModeChanged(isFeedMode: self.feedBtn.isSelected)
    }

}
