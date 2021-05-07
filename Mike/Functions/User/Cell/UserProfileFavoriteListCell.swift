//
//  UserProfileFavoriteListCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/6.
//

import UIKit

class UserProfileFavoriteListCell: UICollectionViewCell {
    @IBOutlet weak var bgImg:UIImageView!
    @IBOutlet weak var bigImg:UIImageView!
    @IBOutlet weak var titleLab:UILabel!
    @IBOutlet weak var timeLab:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.bgImg.clipsToBounds = false
        self.bgImg.layer.cornerRadius = 15
        self.bgImg.layer.shadowColor = HexRGBAlpha(0xff7088D2,0.2).cgColor
        self.bgImg.layer.shadowOffset = CGSize(width: 5, height: 8)
        self.bgImg.layer.shadowOpacity = 0.5
    }

}
