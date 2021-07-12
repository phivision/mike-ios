//
//  VideoCaptureUploadCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/27.
//

import UIKit
@objc protocol VideoCaptureUploadCellDelegate {
    @objc optional func addCaptureBtnClicked()
    @objc optional func delCaptureBtnClicked()
}
class VideoCaptureUploadCell: UITableViewCell {
    @IBOutlet weak var addBtn:UIButton!
    @IBOutlet weak var uploadTitle:UILabel!
    @IBOutlet weak var delBtn:UIButton!
    weak var delegate:VideoCaptureUploadCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setCaptureImg(image:UIImage?){
        if let img = image {
            self.addBtn.setImage(img, for: .normal)
            self.delBtn.isHidden = false
        }else{
            self.addBtn.setImage(UIImage(named: "btn_upload"), for: .normal)
            self.delBtn.isHidden = true
        }
    }
    @IBAction func addBtnPressed(){
        self.delegate?.addCaptureBtnClicked?()
    }
    @IBAction func delBtnPressed(){
        self.delegate?.delCaptureBtnClicked?()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
