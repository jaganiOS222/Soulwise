//
//  FeedsItemViewModel.swift
//  Soulwise
//
//  Created by apple on 02/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import Foundation


class FeedsItemViewModel {
    var newsFeedList:NewsFeedList?
    
    lazy var title:String = {
        if let name = newsFeedList?.header {
            return name
        }
        return ""
    }()
    
    lazy var type:String = {
        if let type = newsFeedList?.type {
            return type
        }
        return ""
    }()
    
    lazy var image:String = {
        if let icon = newsFeedList?.image {
            return icon
        }
        return ""
    }()
    
    lazy var createTime:String = {
        if let time = newsFeedList?.createTime {
            return time
        }
        return ""
    }()
    
    lazy var description:String = {
        if let desc = newsFeedList?.newsFeedListDescription {
            return desc
        }
        return ""
    }()
    
    init(_ feedData:NewsFeedList) {
        self.newsFeedList = feedData
    }
    
    func display() -> [TBRow]? {
        let rowData = TBRowData.init()
        rowData.model = self
        let row = TBRow.init(.meditationCell, rowData)
        return [row]
    }
}
