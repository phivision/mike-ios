//
//  JsonHelper.swift
//  Mike
//
//  Created by 殷聃 on 2021/6/16.
//

import Foundation

class JsonHelper {
    static func convertJsonFileToDic(fileName:String?) -> NSDictionary{
        let path = Bundle.main.path(forResource: fileName ?? "", ofType: "json")
        let data:NSData = try! NSData(contentsOfFile: path ?? "")
        guard  let d = try? JSONSerialization.jsonObject(with: data as Data, options: .mutableContainers) else {
            return NSDictionary()
        }
        let dic = d as! NSDictionary
        return dic
    }
}
