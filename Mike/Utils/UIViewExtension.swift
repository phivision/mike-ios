//
//  UIViewExtension.swift
//  Boyaios
//
//  Created by huasen on 2020/2/27.
//  Copyright © 2020 yind. All rights reserved.
//

import Foundation
import UIKit
extension UIView
{
    // MARK : 坐标尺寸
    
    var origin:CGPoint {
        get {
            return self.frame.origin
        }
        set(newValue) {
            var rect = self.frame
            rect.origin = newValue
            self.frame = rect
        }
    }
    
    var size:CGSize {
        get {
            return self.frame.size
        }
        set(newValue) {
            var rect = self.frame
            rect.size = newValue
            self.frame = rect
        }
    }
    
    var left:CGFloat {
        get {
            return self.frame.origin.x
        }
        set(newValue) {
            var rect = self.frame
            rect.origin.x = newValue
            self.frame = rect
        }
    }
    
    var top:CGFloat {
        get {
            return self.frame.origin.y
        }
        set(newValue) {
            var rect = self.frame
            rect.origin.y = newValue
            self.frame = rect
        }
    }
    
    var right:CGFloat {
        get {
            return (self.frame.origin.x + self.frame.size.width)
        }
        set(newValue) {
            var rect = self.frame
            rect.origin.x = (newValue - self.frame.size.width)
            self.frame = rect
        }
    }
    
    var bottom:CGFloat {
        get {
            return (self.frame.origin.y + self.frame.size.height)
        }
        set(newValue) {
            var rect = self.frame
            rect.origin.y = (newValue - self.frame.size.height)
            self.frame = rect
        }
    }
    
    var width:CGFloat{
        get{
            return self.frame.size.width
        }
        set(newValue){
            var rect = self.frame
            rect.size.width = newValue
            self.frame = rect
        }
    }
    
    var height:CGFloat{
        get{
            return self.frame.size.height
        }
        set(newValue){
            var rect = self.frame
            rect.size.height = newValue
            self.frame = rect
        }
    }
    
    // MARK: - 位移
    
    // 移动到指定中心点位置
    func moveToPoint(point:CGPoint) -> Void
    {
        var center = self.center
        center.x = point.x
        center.y = point.y
        self.center = center
    }
    
    // 缩放到指定大小
    func scaleToSize(scale:CGFloat) -> Void
    {
        var rect = self.frame
        rect.size.width *= scale
        rect.size.height *= scale
        self.frame = rect
    }
    func addCorner(conrners: UIRectCorner , radius: CGFloat) {
           let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: conrners, cornerRadii: CGSize(width: radius, height: radius))
           let maskLayer = CAShapeLayer()
           maskLayer.frame = self.bounds
           maskLayer.path = maskPath.cgPath
           self.layer.mask = maskLayer
       }
}
