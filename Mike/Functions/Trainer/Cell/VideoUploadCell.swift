//
//  VideoUploadCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/27.
//

import UIKit
@objc protocol VideoUploadCellDelegate {
    @objc optional func addBtnClicked()
}
class VideoUploadCell: UITableViewCell {
    @IBOutlet weak var addBtn:UIButton!
    weak var delegate:VideoUploadCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func addBtnPressed(){
        self.delegate?.addBtnClicked?()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
