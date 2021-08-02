//
//  AgeUtils.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/11.
//

import UIKit

class AgeUtils: NSObject {
    static func getAge(birthdayStr:String) ->Int{
        if StringUtils.isBlank(value: birthdayStr) {
            return 0 
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let startDate = dateFormatter.date(from: birthdayStr)
        let endDate = Date()
        let calendar = Calendar.current
        let calcAge = calendar.dateComponents([Calendar.Component.year], from: startDate!, to: endDate)
        let age = calcAge.year
        return age ?? 0
    }
    static func transDate(oldFormat old:String,newFormat new:String,dateValue:String) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = old
        if let date = formatter.date(from: dateValue) {
            let dateForm = DateFormatter()
            dateForm.dateFormat = new
            let dateStr = dateForm.string(from: date)
            return dateStr
        }else{
            return dateValue
        }
    }
}
