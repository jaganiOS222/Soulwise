//
//  VideoPlayerView.swift
//  Soulwise
//
//  Created by apple on 07/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

protocol VideoPlayerViewDelegate:AnyObject {
    func closeView()
}

class VideoPlayerView: UIView {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var playButton:UIButton!
    @IBOutlet weak var endTimeLabel:UILabel!
    @IBOutlet weak var startTimeLabel:UILabel!
    @IBOutlet weak var progressBar:UIProgressView!

    var delegate:VideoPlayerViewDelegate?
    var videoLink:String? {
        didSet {
            if let link = videoLink {
                playVideo(link: link)
            }
        }
    }
    
    var avPlayerController:AVPlayerViewController? = AVPlayerViewController()
    var avPlayer:AVPlayer = AVPlayer()

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialInits()
    }
    
    private func initialInits() {
        Bundle.main.loadNibNamed("VideoPlayerView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        avPlayerController?.view.frame = videoView.bounds
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
        endTimeLabel.text = Helper.videoTotalTimeText(url: url)
    }
    
    @IBAction func playButtonAction(_ sender:UIButton) {
        if playButton.isSelected {
            avPlayer.pause()
            playButton.isSelected = false
        } else {
            avPlayer.play()
            playButton.isSelected = true
        }
        addingImages(playButton.isSelected)
    }
    
    func addingImages(_ isSelected:Bool) {
        let name:String = isSelected ? "pause" : "play"
        playButton.setImage(UIImage(named: name), for: .normal)
    }
    
    @IBAction func backButton(_ sender:UIButton) {
        
    }
   
}
