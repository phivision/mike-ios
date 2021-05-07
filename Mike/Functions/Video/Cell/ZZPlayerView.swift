//
//  ZZPlayerView.swift
//  Boyaios
//
//  Created by huasen on 2020/3/6.
//  Copyright © 2020 yind. All rights reserved.
//

import UIKit
import AVKit
class ZZPlayerView: UIView {
    var playerLayer:AVPlayerLayer?
    var timeLabel:UILabel!
    override func awakeFromNib() {
        timeLabel = UILabel()
        timeLabel.textColor = UIColor.white
        timeLabel.font = UIFont.systemFont(ofSize: 12)
        self.addSubview(timeLabel)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer?.frame = self.bounds
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
