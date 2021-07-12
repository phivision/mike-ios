//
//  SearchResultListCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/7/12.
//

import UIKit

class SearchResultListCell: UITableViewCell {
    @IBOutlet weak var avatarImg:UIButton!
    @IBOutlet weak var nameLab:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.avatarImg.imageView?.layer.cornerRadius = 17.5
        self.avatarImg.imageView?.clipsToBounds = true
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
