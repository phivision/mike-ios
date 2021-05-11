//
//  UserContentSegmentListCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/9.
//

import UIKit

class UserContentSegmentListCell: UITableViewCell {
    @IBOutlet weak var titleLab:UILabel!
    @IBOutlet weak var subTitleLab:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setModel(model:UserContentSegmentListModel){
        self.titleLab.text = "\(model.name ?? "")"
        self.subTitleLab.text = "\(model.timestamp ?? "") mins"
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
