//
//  UserSettingSubscribeCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/7/15.
//

import UIKit
@objc protocol UserSettingSubscribeCellDelegate{
    @objc func subscriptionPriceChanged(price:String)
    @objc func tokenPriceChanged(price:String)
}
class UserSettingSubscribeCell: UITableViewCell,UITextFieldDelegate {
    @IBOutlet weak var subscriptionPriceBg:UIImageView!
    @IBOutlet weak var perMessagePriceBg:UIImageView!
    @IBOutlet weak var subscriptionPrice:UITextField!
    @IBOutlet weak var perMessagePrice:UITextField!
    weak var delegate:UserSettingSubscribeCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.subscriptionPriceBg.layer.cornerRadius = 5
        self.subscriptionPriceBg.layer.borderWidth = 1
        self.subscriptionPriceBg.layer.borderColor = lightGreyColor.cgColor
        self.perMessagePriceBg.layer.cornerRadius = 5
        self.perMessagePriceBg.layer.borderWidth = 1
        self.perMessagePriceBg.layer.borderColor = lightGreyColor.cgColor
        self.perMessagePrice.delegate = self
        self.subscriptionPrice.delegate = self
        self.perMessagePrice.keyboardType = .numberPad
        self.subscriptionPrice.keyboardType = .numberPad
        self.subscriptionPrice.addTarget(self, action: #selector(subscriptionPriceChanged(textfield:)), for: .editingChanged)
        self.perMessagePrice.addTarget(self, action: #selector(tokenPriceChanged(textfield:)), for: .editingChanged)
    }
    @objc func subscriptionPriceChanged(textfield:UITextField){
        self.delegate?.subscriptionPriceChanged(price: textfield.text ?? "0")
    }
    @objc func tokenPriceChanged(textfield:UITextField){
        self.delegate?.tokenPriceChanged(price: textfield.text ?? "0")
    }
    func setModel(trainerModel:UserCenterTrainer){
        self.subscriptionPrice.text = "\(trainerModel.subscriptionPrice ?? 0)"
        self.perMessagePrice.text = "\(trainerModel.tokenPrice ?? 0)"
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField.text == "0" {
            textField.text = ""
        }
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if StringUtils.isBlank(value: textField.text) {
            textField.text = "0"
        }
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return self.validateNumber(number: string as NSString)
    }
    func validateNumber(number:NSString) -> Bool{
        var res:Bool = true
        let tmpSet:NSCharacterSet = NSCharacterSet(charactersIn: "0123456789")
        var i:Int = 0
        while i < number.length {
            let string:NSString = number.substring(with: NSMakeRange(i, 1)) as NSString
            let range:NSRange = string.rangeOfCharacter(from: tmpSet as CharacterSet)
            if range.length == 0 {
                res = false
                break
            }
            i += 1
        }
        return res
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
