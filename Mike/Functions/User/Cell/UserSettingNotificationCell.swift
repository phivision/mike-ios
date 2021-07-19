//
//  UserSettingNotificationCell.swift
//  Mike
//
//  Created by 殷聃 on 2021/7/15.
//

import UIKit

class UserSettingNotificationCell: UITableViewCell {
    @IBOutlet weak var notificationButton:UISwitch!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        isRegisteredForRemoteNotifications
        self.notificationButton.isOn = UIApplication.shared.isRegisteredForRemoteNotifications
    }
    @IBAction func changeNotification(changeBtn:UISwitch){
        if changeBtn.isOn == true {
            DispatchQueue.main.async {
                // Register with Apple Push Notification service
                UIApplication.shared.registerForRemoteNotifications()
                self.notificationButton.isOn = UIApplication.shared.isRegisteredForRemoteNotifications
            }
        }else{
            DispatchQueue.main.async {
                // Register with Apple Push Notification service
                UIApplication.shared.unregisterForRemoteNotifications()
                self.notificationButton.isOn = UIApplication.shared.isRegisteredForRemoteNotifications
            }
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
