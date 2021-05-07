//
//  ArchiveTool.swift
//  Boyaios
//
//  Created by huasen on 2020/3/21.
//  Copyright © 2020 yind. All rights reserved.
//

import UIKit

class ArchiveTool: NSObject {
    static func archiveModel(model:Any,toPath path:String!) -> Bool {
        do{
            let data:Data = try NSKeyedArchiver.archivedData(withRootObject: model, requiringSecureCoding: true)
            do{
                try data.write(to: URL(fileURLWithPath: path), options: .atomicWrite)
                return true
            }catch{
                return false
            }
        }catch{
            return false
        }
    }
    static func unarchive(path:String!)->Any{
        do{
            let data:NSData = try NSData.init(contentsOfFile: path)
            do {
                let content = try NSKeyedUnarchiver.unarchivedObject(ofClass: LoginInfoModel.self, from: data as Data)
                return content ?? ""
            } catch {
                print(error)
                return ""
            }
        }catch{
            return ""
        }
        
    }
    static func fetchPath(pathKey:String!)-> String{
        let path:NSURL = NSURL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? "").appendingPathComponent(pathKey)! as NSURL
        let pathStr:String = path.relativePath ?? ""
        return pathStr
    }
}
