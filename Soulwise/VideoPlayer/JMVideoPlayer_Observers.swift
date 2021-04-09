//
//  JMVideoPlayer_Observers.swift
//  Soulwise
//
//  Created by apple on 09/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
//MARK:- Observers for End and change of progress bar
extension JMVideoPlayer {
    public func addingObservers(for avplayer:AVPlayer?) {
        if let player = avplayer {
            player.addObserver(self, forKeyPath: "timeControlStatus", options: [.new,.old,.initial], context: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(playerDidEndPlaying), name: .AVPlayerItemDidPlayToEndTime, object: nil)
            player.currentItem?.addObserver(self, forKeyPath: "status", options: NSKeyValueObservingOptions(rawValue: 0), context: nil)
        }
    }
}

extension JMVideoPlayer {
    @objc func playerDidEndPlaying(_ notification:NSNotification) {
        DispatchQueue.main.async { [weak self] in
            if let playerItem = notification.object as? AVPlayerItem {
                playerItem.seek(to: .zero, completionHandler: nil)
                    self?.pauseVideo()
            }
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "timeControlStatus", let change = change, let newValue = change[NSKeyValueChangeKey.newKey] as? Int, let oldValue = change[NSKeyValueChangeKey.oldKey] as? Int {
            let oldStatus = AVPlayer.TimeControlStatus(rawValue: oldValue)
            let newStatus = AVPlayer.TimeControlStatus(rawValue: newValue)
            if newStatus != oldStatus {
                DispatchQueue.main.async {[weak self] in
                    if newStatus == .playing || newStatus == .paused {
                        self?.hideLoderView()
                    } else {
                        self?.unhideLoderView()
                    }
                }
            }
        }
    }
    
    private func hideLoderView() {
        self.loaderView.isHidden = true
        self.overLayView.isHidden = false
    }
    
    private func unhideLoderView() {
        self.loaderView.isHidden = false
        self.overLayView.isHidden = true
    }
}
