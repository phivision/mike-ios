//
//  SelectCoverCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/6/14.
//

import UIKit
@objc protocol SelectCoverCellDelegate {
    @objc optional func reselectCoverBtnClicked()
}
class SelectCoverCell: UITableViewCell {
    @IBOutlet weak var videoCapture:UIImageView!
    weak var delegate:SelectCoverCellDelegate?
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
        self.delegate?.reselectCoverBtnClicked?()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
