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

//MARK:- Show ProgressView
extension JMVideoPlayer {
    func progress() {
        avPlayer?.addPeriodicTimeObserver(forInterval: CMTime(seconds: 1, preferredTimescale: 2), queue: DispatchQueue.main) { [weak self] (progressTime) in
            if let duration = self?.avPlayer?.currentItem?.duration {
                let durationSeconds = CMTimeGetSeconds(duration)
                let seconds = CMTimeGetSeconds(progressTime)
                let progress = Float(seconds/durationSeconds)
                self?.startTimeLabel.text = Helper.convertVideoTime(seconds: Int(seconds))
                if durationSeconds > 0 {
                   self?.endTimeLabel.text = Helper.convertVideoTime(seconds: Int(durationSeconds))
                }
                DispatchQueue.main.async {
                    self?.progressBar.progress = progress
                    if progress >= 1.0 {
                        self?.progressBar.progress = 0.0
                    }
                }
            }
        }
    }
}

//MARK:- Video Speed handling
extension JMVideoPlayer {
    func addingSpeedButtonsProgramatically(_ speedVariants:[String]) {
        for i in 0..<speedVariants.count {
            let button = UIButton()
            speedStackView.addArrangedSubview(button)
            button.setTitle(speedVariants[i], for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
            button.sizeThatFits(CGSize(width: 100, height: 25)) 
            button.addTarget(self, action: #selector(onTapSpeed), for: .touchUpInside)
            button.backgroundColor = .clear
        }
    }
    
    @objc func onTapSpeed(_ sender:UIButton) {
        if let speed = sender.titleLabel?.text {
            let rate = Float(speed.replacingOccurrences(of: "x", with: ""))
            avPlayer?.rate = rate ?? 0.0
            self.playButton.isSelected = true
            playButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)

        }
        speedStackView.isHidden = true

    }
}
