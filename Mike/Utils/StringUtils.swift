//
//  StringExtension.swift
//  Boyaios
//
//  Created by huasen on 2020/2/28.
//  Copyright © 2020 yind. All rights reserved.
//

import Foundation

class StringUtils:NSObject{
    static func isBlank(value: String?) -> Bool {
        //首先判断是否为nil
        if (nil == value) {
            //对象是nil，直接认为是空串
            return true
        }else{
            //然后是否可以转化为String
            if let myValue = value as? String{
                //然后对String做判断
                return myValue == "" || myValue == "(null)" || 0 == myValue.count
            }else{
                //字符串都不是，直接认为是空串
                return true
            }
        }
    }
    static func handleVideoKey(filename:String?) -> String{
        let filename = filename?.components(separatedBy: ".")
        let timeInterval: TimeInterval = Date().timeIntervalSince1970
        let timeStamp = Int(timeInterval)
        let finalKey = String(format: "%@%@%@", (filename?.first ?? ""), LoginTools.sharedTools.userId(), String(format: "%d", timeStamp))
        print("~~~~~~~~~~~~~\(finalKey)")
        let pattern:String = "[^a-z0-9]"
        let regularExpress:NSRegularExpression = try! NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        let string = regularExpress.stringByReplacingMatches(in: finalKey, options: .withoutAnchoringBounds, range: NSRange(location: 0, length: finalKey.count), withTemplate: "")
        let videoKey = "\(string).\(filename?.last ?? "")"
        return videoKey
    }
    static func thumbnailImgKey() -> String{
        let timeInterval: TimeInterval = Date().timeIntervalSince1970
        let timeStamp = Int(timeInterval)
        let finalKey = String(format: "Thumbnail%@%@", LoginTools.sharedTools.userId(), String(format: "%d", timeStamp))
        return finalKey
    }
}
