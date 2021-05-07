//
//  UserProfileTrainerListCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/6.
//

import UIKit
import Amplify
class UserProfileTrainerListCell: UICollectionViewCell {
    @IBOutlet weak var avatar:UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.avatar.layer.cornerRadius = 15
        self.avatar.clipsToBounds = true
    }
    func setModel(model:UserCenterTrainer){
        if StringUtils.isBlank(value: model.userImage) {
            self.avatar.image = UIImage(named: "logo")
        }else{
            Amplify.Storage.getURL(key: model.userImage) { event in
                switch event {
                case let .success(url):
                    print("Completed: \(url)")
                    self.avatar.sd_setImage(with: url, placeholderImage: UIImage(named: "logo"), options: .refreshCached, completed: nil)
                case let .failure(storageError):
                    print("Failed: \(storageError.errorDescription). \(storageError.recoverySuggestion)")
                    self.avatar.image = UIImage(named: "logo")
                }
            }
        }
        
    }
}
