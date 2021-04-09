//
//  Helper.swift
//  Soulwise
//
//  Created by apple on 08/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import Foundation
import  AVKit
class Helper {
    public static func convertVideoTime (seconds : Int) -> String {
        let sec = (seconds % 3600) % 60
        let minutes = (seconds % 3600) / 60
        let hours = seconds / 3600
        let videoDuration = String(format: "%02lu:%02lu:%02lu", UInt(hours), UInt(minutes), UInt(sec))
        return videoDuration
    }
}

class LoaderView: UIImageView {
    override func awakeFromNib() {
        super.awakeFromNib()
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = .pi * 2.0 * 2 * 60.0
        rotationAnimation.duration = 200.0
        rotationAnimation.isCumulative = true
        rotationAnimation.repeatCount = Float.infinity
        self.layer.add(rotationAnimation, forKey: "rotationAnimation")
    }
}
