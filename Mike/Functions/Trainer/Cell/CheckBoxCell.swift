//
//  CheckBoxCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/28.
//

import UIKit
@objc protocol CheckBoxCellDelegate {
    @objc optional func checkChanged(isChecked:Bool)
}
class CheckBoxCell: UITableViewCell {
    @IBOutlet weak var checkBtn:UIButton!
    @IBOutlet weak var descLab:UILabel!
    weak var delegate:CheckBoxCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setCheckStatus(isCheck:Bool){
        self.checkBtn.isSelected = isCheck
    }
    @IBAction func checkBtnPressed(){
        self.checkBtn.isSelected = !self.checkBtn.isSelected
        self.delegate?.checkChanged?(isChecked: self.checkBtn.isSelected)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
