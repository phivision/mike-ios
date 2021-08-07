//
//  ChargeListCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/7/20.
//

import UIKit
import StoreKit
class ChargeListCell: UITableViewCell {
    @IBOutlet weak var coinNumLab:UILabel!
    @IBOutlet weak var priceLab:UILabel!
    @IBOutlet weak var discountLab:UILabel!
    @IBOutlet weak var listBg:UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.listBg.layer.cornerRadius = 10
        self.listBg.backgroundColor = lightGreyColor
    }
    func setProduct(product:SKProduct){
        self.priceLab.text = "\(product.price)"
        self.coinNumLab.text = "\(product.localizedTitle)"
        let coinCount = Decimal(string: String(product.localizedTitle[..<product.localizedTitle.firstIndex(of: " ")!]))!
        let discount = (1 - (product.price as Decimal/coinCount)/0.2)*100
        let intDiscount = Int(truncating: NSDecimalNumber(decimal: discount))
        if (intDiscount > 0) {
            self.discountLab.text = "\(intDiscount)% Discount"
        } else {
            self.discountLab.isHidden = true
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
