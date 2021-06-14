//
//  VideoCaptureUploadCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/27.
//

import UIKit
@objc protocol VideoCaptureUploadCellDelegate {
    @objc optional func addCaptureBtnClicked()
}
class VideoCaptureUploadCell: UITableViewCell {
    @IBOutlet weak var addBtn:UIButton!
    @IBOutlet weak var uploadTitle:UILabel!
    weak var delegate:VideoCaptureUploadCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func addBtnPressed(){
        self.delegate?.addCaptureBtnClicked?()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
