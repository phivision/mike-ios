//
//  DateExtention.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/5.
//

import Foundation
extension NSDate {
    func dayOfWeek() -> String {
         let interval = self.timeIntervalSince1970;
         let days = Int(interval / 86400);
        switch (days - 3) % 7{
        case 1:
            return "Mon"
        case 2:
            return "Tues"
        case 3:
            return "Wed"
        case 4:
            return "Thur"
        case 5:
            return "Fri"
        case 6:
            return "Sat"
        case 7:
            return "Sun"
        default:
            return ""
        }
    }
}
