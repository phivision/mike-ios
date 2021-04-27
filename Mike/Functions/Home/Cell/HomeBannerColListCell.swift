//
//  HomeBannerColListCell.swift
//  MikeIOS
//
//  Created by 殷聃 on 2021/4/26.
//

import UIKit

class HomeBannerColListCell: UICollectionViewCell {
    @IBOutlet weak var bgImg:UIImageView!
    @IBOutlet weak var titleLab:UILabel!
    @IBOutlet weak var subTitleLab:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.bgImg.layer.cornerRadius = 10
        self.bgImg.clipsToBounds = true
    }

}
