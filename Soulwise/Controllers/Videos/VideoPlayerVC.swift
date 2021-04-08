//
//  VideoPlayerVC.swift
//  Soulwise
//
//  Created by apple on 06/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class VideoPlayerVC: UIViewController,VideoPlayerViewDelegate {
    func closeView(sender: Bool) {
        print(sender)
    }
    
   
    
    @IBOutlet weak var videoView:VideoPlayerView!
    var videoItem:VideosItemViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videoView.videoLink = videoItem?.videoLink
        videoView.backButton.addTarget(self, action: #selector(ontapBack(_ :)), for: .touchUpInside)
    }
    
    @objc func ontapBack(_ sender:UIButton) {
        self.dismiss(animated: true, completion: nil)
        videoView.avPlayer.pause()
        
    }
    
    
}
