//
//  SegmentInputCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/7/13.
//

import UIKit
@objc protocol SegmentInputCellDelegate {
    @objc optional func segmentChanged(textValue:String?,index:IndexPath?)
    @objc optional func segmentTimeClicked(index:IndexPath?)
    @objc optional func segmentDelAction(index:IndexPath?)
}
class SegmentInputCell: UITableViewCell {
    @IBOutlet weak var nameBg:UIImageView!
    @IBOutlet weak var timeBg:UIImageView!
    @IBOutlet weak var nameText:UITextField!
    @IBOutlet weak var timeText:UITextField!
    @IBOutlet weak var inputBg:UIView!
    var index:IndexPath?
    weak var delegate:SegmentInputCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.configView()
    }
    func configView(){
        self.inputBg.layer.borderWidth = 1
        self.inputBg.layer.borderColor = HexRGBAlpha(0xF4F4F4,1).cgColor
        self.inputBg.layer.cornerRadius = 5
        
//        self.nameText.delegate = self
//        self.timeText.delegate = self
    }
    func setModel(model:UserContentSegmentListModel,index:IndexPath?){
        self.nameText.text = model.name
        self.timeText.text = model.timestamp
        self.index = index
    }
    @IBAction func inputTextChanged(textfield:UITextField){
        self.delegate?.segmentChanged?(textValue: textfield.text, index: self.index)
    }
    @IBAction func timeValueClicked(){
        self.delegate?.segmentTimeClicked?(index: self.index)
    }
    @IBAction func delBtnClicked(){
        self.delegate?.segmentDelAction?(index: self.index)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
