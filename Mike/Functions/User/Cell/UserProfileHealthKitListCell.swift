//
//  UserProfileHealthKitListCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/6.
//

import UIKit
enum HealthType {
    case calories
    case weight
    case water
    case steps
}
class UserProfileHealthKitListCell: UICollectionViewCell {
    @IBOutlet weak var backImg:UIImageView!
    @IBOutlet weak var titleLab:UILabel!
    @IBOutlet weak var centerImg:UIImageView!
    @IBOutlet weak var valueLab:UILabel!
    @IBOutlet weak var updateTimeLab:UILabel!
    @IBOutlet weak var unitLab:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backImg.layer.cornerRadius = 20
        self.backImg.clipsToBounds = true
    }
    func setModel(model:UserMatricsListModel){
        switch model.type {
        case .calories:
            self.backImg.backgroundColor = HexRGBAlpha(0x8C80F8,1)
            self.centerImg.image = UIImage(named: "health_calories")
        case .weight:
            self.backImg.backgroundColor = HexRGBAlpha(0xAF8EFF,1)
            self.centerImg.image = UIImage(named: "health_weight")
        case .water:
            self.backImg.backgroundColor = HexRGBAlpha(0x1F87FE,1)
            self.centerImg.image = UIImage(named: "health_water")
        case .steps:
            self.backImg.backgroundColor = HexRGBAlpha(0x4C5980,1)
            self.centerImg.image = UIImage(named: "health_step")
        default:
            self.backImg.backgroundColor = HexRGBAlpha(0x8C80F8,1)
            self.centerImg.image = UIImage(named: "health_calories")
        }
        self.titleLab.text = "\(model.title ?? "")"
        self.valueLab.text = "\(model.contentValue ?? "")"
        self.unitLab.text = "\(model.unit ?? "")"
        self.updateTimeLab.text = "\(model.updateTime ?? "")"
    }
//    func setValue(value:String,type:HealthType){
//        switch type {
//        case .calories:
//            self.titleLab.text = "CALORIES"
//            self.backImg.backgroundColor = HexRGBAlpha(0x8C80F8,1)
//            self.centerImg.image = UIImage(named: "health_calories")
//        case .weight:
//            self.titleLab.text = "WEIGHT"
//            self.backImg.backgroundColor = HexRGBAlpha(0xAF8EFF,1)
//            self.centerImg.image = UIImage(named: "health_weight")
//        case .water:
//            self.titleLab.text = "WATER"
//            self.backImg.backgroundColor = HexRGBAlpha(0x1F87FE,1)
//            self.centerImg.image = UIImage(named: "health_water")
//        case .steps:
//            self.titleLab.text = "STEPS"
//            self.backImg.backgroundColor = HexRGBAlpha(0x4C5980,1)
//            self.centerImg.image = UIImage(named: "health_step")
//        }
//    }
}
