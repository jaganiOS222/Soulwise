//
//  VideoPlayerVC.swift
//  Soulwise
//
//  Created by apple on 06/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class VideoPlayerVC: UIViewController {
    func closeView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var videoView:VideoPlayerView!
    var videoItem:VideosItemViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videoView.videoLink = videoItem?.videoLink
    }
    
    
    
}
