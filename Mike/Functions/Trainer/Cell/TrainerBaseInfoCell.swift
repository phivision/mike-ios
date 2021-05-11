//
//  TrainerBaseInfoCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/11.
//

import UIKit

class TrainerBaseInfoCell: UICollectionViewCell {
    @IBOutlet weak var heightLab:UILabel!
    @IBOutlet weak var weightLab:UILabel!
    @IBOutlet weak var ageLab:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setModel(model:TrainerDetailModel){
        self.heightLab.text = String(describing: model.height ?? 0)
        self.weightLab.text = String(describing: model.weight ?? 0)
        self.ageLab.text = String(describing: AgeUtils.getAge(birthdayStr:"\(model.birthday ?? "")"))
    }
}
