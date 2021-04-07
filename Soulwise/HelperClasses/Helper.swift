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
    private static func convertVideoTime (seconds : Int) -> String {
        let sec = (seconds % 3600) % 60
        let minutes = (seconds % 3600) / 60
        let hours = seconds / 3600
        let videoDuration = String(format: "%02lu:%02lu:%02lu", UInt(hours), UInt(minutes), UInt(sec))
        return videoDuration
    }
    
    private  static func getVideoTime(url:URL) -> Int {
        let asset = AVAsset(url: url)
        let duration = asset.duration
        let durationTime = CMTimeGetSeconds(duration)
        return Int(durationTime)
    }
    
  static func videoTotalTimeText(url:URL) -> String {
        let interVals = getVideoTime(url: url)
        let time = convertVideoTime(seconds: interVals)
        return time
    }
}
