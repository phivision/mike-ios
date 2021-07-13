//
//  SegmentSectionHeaderView.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/28.
//

import UIKit
@objc protocol SegmentSectionHeaderViewDelegate {
    @objc optional func addBtnClicked()
}
class SegmentSectionHeaderView: UITableViewHeaderFooterView {
    @IBOutlet weak var sectionTitle:UILabel!
    weak var delegate:SegmentSectionHeaderViewDelegate?
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBAction func delBtnPressed(){
        self.delegate?.addBtnClicked?()
    }
}
