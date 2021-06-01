//
//  ContentInputCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/28.
//

import UIKit
@objc protocol ContentInputCellDelegate {
    @objc optional func inputTextChanged(textValue:String?,indexPath:IndexPath)
}
class ContentInputCell: UITableViewCell {
    @IBOutlet weak var InputBg:UIImageView!
    @IBOutlet weak var InputText:UITextField!
    var index:IndexPath?
    weak var delegate:ContentInputCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.hanldeBgCornerAndShadow(bgView: self.InputBg)
    }
    func setTitle(_ title:String?,textValue:String?,indexPath:IndexPath){
        self.InputText.placeholder = title ?? ""
        self.InputText.text = textValue
        self.index = indexPath
    }
    func setTitle(_ title:String?,textValue:String?,indexPath:IndexPath,shouldEdit:Bool){
        self.InputText.placeholder = title ?? ""
        self.InputText.text = textValue
        self.index = indexPath
        self.InputText.isEnabled = shouldEdit
    }
    func hanldeBgCornerAndShadow(bgView:UIImageView){
        bgView.clipsToBounds = false
        bgView.layer.cornerRadius = 20
        bgView.layer.shadowColor = HexRGBAlpha(0xff000000,0.16).cgColor
        bgView.layer.shadowOffset = CGSize(width: 2, height: 2)
        bgView.layer.shadowOpacity = 2
    }
    @IBAction func inputTextChanged(textfield:UITextField){
        self.delegate?.inputTextChanged?(textValue: textfield.text, indexPath: self.index!)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
