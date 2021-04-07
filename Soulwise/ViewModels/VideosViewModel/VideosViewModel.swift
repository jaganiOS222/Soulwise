//
//  VideosViewModel.swift
//  Soulwise
//
//  Created by apple on 06/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import Foundation

class VideosViewModel {
    var videosItemViewModel:[VideosItemViewModel] = []
    
    init(_ videos:[Video]) {
        videos.forEach({
            videosItemViewModel.append(VideosItemViewModel.init($0))
        })
    }
    
    func display() -> [CVSection] {
        var rows:[CVRow] = []
        videosItemViewModel.forEach({
            rows.append($0.display())
        })
        return [CVSection.init(nil, rows)]
    }
    
    func search(serachText:String) -> [CVSection] {
        var rows:[CVRow] = []
        videosItemViewModel.forEach({
            if $0.title.contains(serachText) {
                rows.append($0.display())
            }
        })
        return [CVSection.init(nil, rows)]
    }
}
