//
//  VideosVC.swift
//  Soulwise
//
//  Created by apple on 06/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class VideosVC: UIViewController {
    var videoItem:VideosItemViewModel?
    @IBOutlet weak var transcriptView:UIView!
    private var videoPlayerVC: VideoPlayerVC?
    private var videoDetailsVC: VideoDetailsVC?
    private var upNextVC: UPNextVC?
    private var transcriptVC: TranscriptVC?

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if let videoPlayerVC = destination as? VideoPlayerVC {
            self.videoPlayerVC = videoPlayerVC
            videoPlayerVC.videoItem = self.videoItem
        }
        
        if let videoDetailsVC = destination as? VideoDetailsVC {
            self.videoDetailsVC = videoDetailsVC
            videoDetailsVC.delegate =  self
            videoDetailsVC.videoItem = self.videoItem
        }
        
        if let upNextVC = destination as? UPNextVC {
            self.upNextVC = upNextVC
        }
        
        if let transcriptVC = destination as? TranscriptVC {
            self.transcriptVC = transcriptVC
        }
    }
    
}

extension VideosVC:videoDetailsVCDelegate {
    func didTapOnTranscriptButton() {
        addingViewAnimation(false)
    }
    
    func didTapOnDownloadButton() {
        
    }
    
}

extension VideosVC {
    @IBAction func transcriptCloseButtonAction(_ sender:UIButton) {
        addingViewAnimation(true)
    }
    
    func addingViewAnimation(_ isToshow:Bool) {
        UIView.transition(with: self.transcriptView, duration: 1.0,
            options: .transitionCrossDissolve,
            animations: {
                self.transcriptView.isHidden = isToshow
        })
    }
}
