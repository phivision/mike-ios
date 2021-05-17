//
//  HeightUtils.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/15.
//

import UIKit

class HeightUtils: NSObject {
    static func getHeightForInch(height:String) ->String{
        let value:Float = Float(height) ?? 0.0
        let number:Float = value/2.54
        var result:String = ""
        if number > 12.0 {
            let subInc  = CGFloat(number).truncatingRemainder(dividingBy: 12)
            result = String(format: "%.0f\'%.0f\"", Float(number/12.0),subInc)
        }else{
            let subInc  = CGFloat(number).truncatingRemainder(dividingBy: 12)
            result = String(format: "0'%.0f\"",subInc)
        }
        return result
    }
}
