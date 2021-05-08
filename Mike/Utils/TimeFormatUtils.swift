//
//  TimeFormatUtils.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/8.
//

import UIKit

class TimeFormatUtils: NSObject {
   static func timeStrWithDate(dateStr:String) -> String {
        let inFormatter = DateFormatter()
        inFormatter.locale = Locale(identifier: "en_US_POSIX")
        inFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        let outFormatter = DateFormatter()
        outFormatter.locale = Locale(identifier: "en_US_POSIX")
        outFormatter.dateFormat = "MM.dd.yy"

        let inStr = "\(dateStr)"
        let date = inFormatter.date(from: inStr)
        let outStr = outFormatter.string(from: date ?? Date())
        return outStr
    }
}
