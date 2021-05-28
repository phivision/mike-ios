//
//  SelectVideoCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/28.
//

import UIKit
@objc protocol SelectVideoCellDelegate {
    @objc optional func reselectBtnClicked()
}
class SelectVideoCell: UITableViewCell {
    @IBOutlet weak var videoCapture:UIImageView!
    weak var delegate:SelectVideoCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.videoCapture.layer.cornerRadius = 20
        self.videoCapture.clipsToBounds = true
    }
    func setImage(image:UIImage?){
        if let img = image {
            self.videoCapture.image = img
        }else{
            self.videoCapture.image = UIImage()
        }
    }
    @IBAction func reselectBtnClicked(){
        self.delegate?.reselectBtnClicked?()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
