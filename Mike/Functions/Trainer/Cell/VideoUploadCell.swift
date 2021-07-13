//
//  VideoUploadCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/27.
//

import UIKit
@objc protocol VideoUploadCellDelegate {
    @objc optional func addVideoBtnClicked()
    @objc optional func delVideoBtnClicked()
}
class VideoUploadCell: UITableViewCell {
    @IBOutlet weak var addBtn:UIButton!
    @IBOutlet weak var uploadTitle:UILabel!
    @IBOutlet weak var delBtn:UIButton!
    @IBOutlet weak var rightMargin:NSLayoutConstraint!
    weak var delegate:VideoUploadCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setVideoImg(image:UIImage?){
        if let img = image {
            self.addBtn.setImage(img, for: .normal)
            self.delBtn.isHidden = false
            self.rightMargin.constant = -60
        }else{
            self.addBtn.setImage(UIImage(named: "btn_upload"), for: .normal)
            self.delBtn.isHidden = true
            self.rightMargin.constant = 0
        }
    }
    @IBAction func addBtnPressed(){
        self.delegate?.addVideoBtnClicked?()
    }
    @IBAction func delBtnPressed(){
        self.delegate?.delVideoBtnClicked?()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
