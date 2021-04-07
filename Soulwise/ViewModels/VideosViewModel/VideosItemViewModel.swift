//
//  VideosItemViewModel.swift
//  Soulwise
//
//  Created by apple on 06/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import Foundation

class VideosItemViewModel {
    var videoModel:Video?
    
    lazy var title:String = {
        return videoModel?.title ?? ""
    }()
    
    lazy var description:String = {
        return videoModel?.videoDescription ?? ""
    }()
    
    lazy var videoLink:String = {
        return videoModel?.sources.joined(separator: " ")  ?? ""
    }()
    
    lazy var thumNail:String = {
        return videoModel?.thumb ?? ""
    }()
    
    func display() -> CVRow {
        let rowData = CVCellData.init()
        rowData.model = self
        let itemRow = CVRow.init(.videoCell, rowData)
        return itemRow
    }
    
    
    init(_ video:Video) {
        self.videoModel = video
    }
}
