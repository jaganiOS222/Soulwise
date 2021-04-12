//
//  JMVideoPlayer_Gestures.swift
//  Soulwise
//
//  Created by apple on 12/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
extension JMVideoPlayer {
    func addingTapGestures() {
        let overLayTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOverLayView(_:)))
        let videoViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapVideoView(_:)))
        videoView.addGestureRecognizer(videoViewTapGesture)
        overLayView.addGestureRecognizer(overLayTapGesture)
    }

    
    @objc func didTapOverLayView(_ sender:UITapGestureRecognizer) {
        overLayView.isHidden = true
    }
    
    @objc func didTapVideoView(_ sender:UITapGestureRecognizer) {
        overLayView.isHidden = false
    }

}
