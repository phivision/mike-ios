//
//  SegmentSectionHeaderView.swift
//  Mike
//
//  Created by 殷聃 on 2021/5/28.
//

import UIKit
@objc protocol SegmentSectionHeaderViewDelegate {
    @objc optional func delBtnClicked(sectionIndex:NSInteger)
}
class SegmentSectionHeaderView: UITableViewHeaderFooterView {
    @IBOutlet weak var sectionTitle:UILabel!
    weak var delegate:SegmentSectionHeaderViewDelegate?
    var sectionIndex:NSInteger = -1
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    func setIndex(section:NSInteger){
        self.sectionIndex = section
        self.sectionTitle.text = "Section \(section+1)"
    }
    @IBAction func delBtnPressed(){
        self.delegate?.delBtnClicked?(sectionIndex: self.sectionIndex)
    }
}
