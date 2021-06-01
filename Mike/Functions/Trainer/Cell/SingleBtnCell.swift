//
//  SingleBtnCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/28.
//

import UIKit
@objc protocol SingleBtnCellDelegate {
    @objc optional func singleBtnClicked()
}
class SingleBtnCell: UITableViewCell {
    @IBOutlet weak var singleBtn:UIButton!
    weak var delegate:SingleBtnCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.singleBtn.layer.cornerRadius = 20
        self.singleBtn.layer.shadowColor = HexRGBAlpha(0xff000000,0.16).cgColor
        self.singleBtn.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.singleBtn.layer.shadowOpacity = 2
    }
    func setBtnTitle(title:String?){
        self.singleBtn.setTitle(title ?? "", for: .normal)
    }
    @IBAction func singleBtnPressed(){
        self.delegate?.singleBtnClicked?()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
