//
//  VideoDetailsVC.swift
//  Soulwise
//
//  Created by apple on 07/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

protocol videoDetailsVCDelegate: AnyObject {
    func didTapOnTranscriptButton()
    func didTapOnDownloadButton()
}
class VideoDetailsVC: UIViewController {
    @IBOutlet weak var transcriptButton:UIButton!
    @IBOutlet weak var downloadButton:UIButton!
    @IBOutlet weak var videoTitle:UILabel!
       @IBOutlet weak var videoDescription:UILabel!
    var delegate:videoDetailsVCDelegate?
    var videoItem:VideosItemViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        videoTitle.text = videoItem?.title
        videoDescription.text = videoItem?.description
    }
    
    @IBAction func trancriptButtonAction(_ sender:UIButton) {
        delegate?.didTapOnTranscriptButton()
    }
    
    @IBAction func downloadButtonAction(_ sender:UIButton) {
        delegate?.didTapOnDownloadButton()
    }
}
