//
//  JMVideoPlayer.swift
//  Soulwise
//
//  Created by apple on 07/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class JMVideoPlayer: UIView {
    
    deinit {
        avPlayer = nil
        NotificationCenter.default.removeObserver(self)
        avPlayerController = nil
    }
    
    //MARK:- Outlets
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var playButton:UIButton!
    @IBOutlet weak var endTimeLabel:UILabel!
    @IBOutlet weak var startTimeLabel:UILabel!
    @IBOutlet weak var progressBar:UIProgressView!
    @IBOutlet weak var backButton:UIButton!
    @IBOutlet weak var loaderView: LoaderView!
    @IBOutlet weak var overLayView: UIView!
    @IBOutlet weak var volumeButton: UIButton!

    //MARK:- Variables
    fileprivate let seekDuration: Float64 = 15.0
    var avPlayerController:AVPlayerViewController? = AVPlayerViewController()
    var avPlayer:AVPlayer? = AVPlayer()
    
    var videoLink:String? {
        didSet {
            if let link = videoLink {
                playVideo(link: link)
            }
        }
    }
    
    public var isMuted:Bool? {
        didSet {
            if let muted = isMuted {
                self.avPlayer?.isMuted = muted
                let imageName = muted ? "speaker" : "speaker.zzz"
                self.volumeButton.setImage(UIImage(systemName: imageName), for: .normal)
            }
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialInits()
    }
    
    private func initialInits() {
        Bundle.main.loadNibNamed("JMVideoPlayer", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        avPlayerController?.view.frame = videoView.bounds
        avPlayerController?.view.cornerRadius = 10.0
        avPlayerController?.view.layer.masksToBounds = true
        contentView.autoresizingMask = [.flexibleHeight , .flexibleWidth]
        if let playerView = avPlayerController?.view {
            videoView.addSubview(playerView)
        }
    }
    
    private func playVideo(link:String) {
        guard let url = URL(string: link) else {return}
        avPlayer = AVPlayer(url: url)
        avPlayerController?.player = avPlayer
        avPlayerController?.showsPlaybackControls = false
        progress()
        addingObservers(for: self.avPlayer)
    }
}

//MARK:- Button Actions
extension JMVideoPlayer {
    @IBAction func playButtonAction(_ sender:UIButton) {
        if sender.isSelected {
            self.pauseVideo()
        } else {
            self.playVideo()
        }
    }
    public func playVideo() {
        self.avPlayer?.play()
        self.playButton.isSelected = true
        playButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
    }
    
    public func pauseVideo() {
        self.avPlayer?.pause()
        self.playButton.isSelected = false
        playButton.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
    }
    
    @IBAction func forward(_ sender:UIButton) {
        if let currentTime = self.avPlayer?.currentTime(), let duration = self.avPlayer?.currentItem?.duration {
            var newTime = CMTimeGetSeconds(currentTime) + seekDuration
            if newTime >= CMTimeGetSeconds(duration) {
                newTime = CMTimeGetSeconds(duration)
            }
            self.avPlayer?.seek(to: CMTime(value: CMTimeValue(newTime * 1000), timescale: 1000))
        }
    }
    
    @IBAction func backword(_ sender:UIButton) {
        if let currentTime = self.avPlayer?.currentTime() {
            var newTime = CMTimeGetSeconds(currentTime) - seekDuration
            if newTime <= 0 {
                newTime = 0
            }
            self.avPlayer?.seek(to: CMTime(value: CMTimeValue(newTime * 1000), timescale: 1000))
        }
    }
    
    @IBAction func mutueUnMute(_ sender:UIButton) {
        if sender.isSelected {
            isMuted = false
            self.volumeButton.isSelected = false
        } else {
            isMuted = true
            self.volumeButton.isSelected = true
        }
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
                self?.endTimeLabel.text = Helper.convertVideoTime(seconds: Int(durationSeconds))
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



