//
//  JSONUtils.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/11.
//

import UIKit

class JSONUtils: NSObject {
    static func getArrayFromJSONString(jsonString:String) ->NSArray{
        if StringUtils.isBlank(value: jsonString){
            return NSArray()
        }else{
            let jsonData:Data = jsonString.data(using: .utf8)!
            let array = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
            if array != nil {
                return array as! NSArray
            }
            return array as! NSArray
        }
    }
}
