//
//  HomeInfoColCell.swift
//  MikeIOS
//
//  Created by 殷聃 on 2021/4/26.
//

import UIKit

class HomeInfoColCell: UICollectionViewCell {
    @IBOutlet weak var bgImg:UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.bgImg.layer.cornerRadius = 15
        self.bgImg.clipsToBounds = true
    }

}
