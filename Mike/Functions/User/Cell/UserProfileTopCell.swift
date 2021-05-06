//
//  UserProfileTopCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/7.
//

import UIKit
import Amplify
class UserProfileTopCell: UICollectionViewCell {
    @IBOutlet weak var contentBg:UIImageView!
    @IBOutlet weak var avatar:UIImageView!
    @IBOutlet weak var userName:UILabel!
    @IBOutlet weak var userDesc:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    
        // Initialization code
        let maskPath:UIBezierPath = UIBezierPath(roundedRect: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight), byRoundingCorners: UIRectCorner(rawValue: UIRectCorner.topLeft.rawValue | UIRectCorner.topRight.rawValue), cornerRadii: CGSize.init(width: 20, height: 20))
            let maskLayer:CAShapeLayer = CAShapeLayer()
            maskLayer.frame = self.contentBg.bounds
            maskLayer.path = maskPath.cgPath
            self.contentBg.layer.mask = maskLayer
        self.avatar.layer.cornerRadius = 20
        self.avatar.clipsToBounds = true
        Amplify.Storage.getURL(key: LoginTools.sharedTools.userInfo().userImage) { event in
            switch event {
            case let .success(url):
                print("Completed: \(url)")
                self.avatar.sd_setImage(with: url, placeholderImage: UIImage(named: "logo"), options: .refreshCached, completed: nil)
            case let .failure(storageError):
                print("Failed: \(storageError.errorDescription). \(storageError.recoverySuggestion)")
                self.avatar.image = UIImage(named: "logo")
            }
        }
        self.userName.text = "\(LoginTools.sharedTools.userInfo().firstName ?? "") \(LoginTools.sharedTools.userInfo().lastName ?? "")"
        self.userDesc.text = "\(LoginTools.sharedTools.userInfo().descriptionField ?? "")"
    }

}
