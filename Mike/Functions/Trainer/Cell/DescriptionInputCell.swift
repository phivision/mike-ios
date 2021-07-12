//
//  DescriptionInputCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/7/12.
//

import UIKit
@objc protocol DescriptionInputCellDelegate {
    @objc optional func descTextChanged(textValue:String?)
}
class DescriptionInputCell: UITableViewCell, UITextViewDelegate {
    @IBOutlet weak var InputBg:UIImageView!
    @IBOutlet weak var InputText:UITextView!
    @IBOutlet weak var titleLab:UILabel!
    var index:IndexPath?
    weak var delegate:DescriptionInputCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.InputText.delegate = self
        self.hanldeBgCornerAndShadow(bgView: self.InputBg)
    }
    func setTitle(_ title:String?,textValue:String?,indexPath:IndexPath){
        self.titleLab.text = title ?? ""
        self.InputText.placeholder = title ?? ""
        self.InputText.text = textValue
        self.index = indexPath
    }
    func setTitle(_ title:String?,textValue:String?,indexPath:IndexPath,shouldEdit:Bool){
        self.titleLab.text = title ?? ""
        self.InputText.placeholder = title ?? ""
        self.InputText.text = textValue
        self.index = indexPath
    }
    func hanldeBgCornerAndShadow(bgView:UIImageView){
        bgView.clipsToBounds = true
        bgView.layer.cornerRadius = 5
        bgView.layer.borderColor = lightGreyColor.cgColor
        bgView.layer.borderWidth = 1
//        bgView.layer.cornerRadius = 20
//        bgView.layer.shadowColor = HexRGBAlpha(0xff000000,0.16).cgColor
//        bgView.layer.shadowOffset = CGSize(width: 2, height: 2)
//        bgView.layer.shadowOpacity = 2
    }
    func textViewDidChange(_ textView: UITextView) {
        self.delegate?.descTextChanged?(textValue: textView.text)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
