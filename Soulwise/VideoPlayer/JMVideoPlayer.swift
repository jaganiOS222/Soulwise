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
protocol JMVideoPlayerDelegate:AnyObject {
    func didTapOnFullScreen()
}


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
    @IBOutlet weak var speedButton: UIButton!
    @IBOutlet weak var speedStackView: UIStackView!

    //MARK:- Variables
    fileprivate let seekDuration: Float64 = 15.0
    var avPlayerController:AVPlayerViewController? = AVPlayerViewController()
    var avPlayer:AVPlayer? = AVPlayer()
    var delegate:JMVideoPlayerDelegate?
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
        addingSpeedButtonsProgramatically(["0.25x","0.5x","1x","2x","5x"])
        addingTapGestures()
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
            volumeButton.isSelected = false
        } else {
            isMuted = true
            volumeButton.isSelected = true
        }
    }
    
    @IBAction func speedButton(_ sender:UIButton) {
        if sender.isSelected {
            speedStackView.isHidden = true
            speedButton.isSelected = false
        } else {
            speedStackView.isHidden = false
            speedButton.isSelected = true
        }
    }
}



