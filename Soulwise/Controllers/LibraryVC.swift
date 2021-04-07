//
//  LibraryVC.swift
//  Soulwise
//
//  Created by apple on 07/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit


class LibraryVC: WLCollectionController {
    let videosService:VideosService = VideosService.init()
    @IBOutlet weak var containerViewWidth: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var searchTextField:UITextField!
    var videosViewModel:VideosViewModel? {
        didSet {
            if let model = videosViewModel {
                sections = model.display()
                searchSections = sections
            }
        }
    }
    
    override func cellTypes() -> [CVCellType] {
        return [
            CVCellType.cvBaseCell,
            CVCellType.videoCell
        ]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.dropShadow(radius: 4, opacity: 0.3)
        containerViewWidth.constant = UIScreen.listAllowedWidth() - 40
        searchTextField.addTarget(self, action: #selector(textFieldDidChange(sender:)), for: .allEvents)


    }
    @objc func textFieldDidChange(sender: UITextField) {
        
        if let searchText = sender.text, searchText.count > 0 {
            if let searchSections = self.videosViewModel?.search(serachText: searchText) {
                sections = searchSections
            }
        } else {
            sections = searchSections
        }
    }

    
    override func loadData() {
        videosService.execute { (result) in
            if result.isSuccess {
                if let videos = result.value as? VideosModel {
                    if let categories = videos.categories {
                        categories.forEach({
                            self.videosViewModel = VideosViewModel.init($0.videos)
                        })
                    }
                }
            }
        }
    }
    
   override  func onAction(action: CellAction, rowInfo: CVRow) {
        switch action {
        case .launchVideo:
            if let model = rowInfo.data?.model as? VideosItemViewModel {
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                if let vc: VideosVC = storyBoard.instantiateViewController(withIdentifier: "VideosVC") as? VideosVC {
                    vc.videoItem = model
                    self.present(vc, animated: true, completion: nil)
                }
            }
        default:break
        }
    }
    

    
}

extension LibraryVC {
    override  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.listAllowedWidth() - 20, height: 140)
    }
}
