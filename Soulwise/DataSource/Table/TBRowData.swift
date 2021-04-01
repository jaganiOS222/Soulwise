//
//  TBRowData.swift
//  Soulwise
//
//  Created by apple on 30/03/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class TBRowData {
    var title:String?
    var description:String?
    var model:Any?
    var icon:String?
    var errorTitle:String?
    var backgroundColour:UIColor?
    
    init(_ title:String? = nil, _ description:String? = nil, _ model:Any? = nil, _ icon:String? = nil, _ errorTitle:String? = nil, _ backgroundColour:UIColor? = nil) {
        self.title = title
        self.description = description
        self.model = model
        self.icon = icon
        self.errorTitle = errorTitle
    }
}
class TBGridItem {
    var title:         String?
    var count:         Int = 0
    var displayTitle:  String?
    var itemType:      CVCellType = .cvBaseCell
    var icon:          String?
    var key:           String?
    var others:        Any?
    var isHighlighted: Bool = false
}

class TBGridRow: TBRowData {
    var columns: Int = 1
    var height: Double = (UIScreen.iPad) ? 68.0 : 50.0
    var gridItems: [TBGridItem] = []
    
    lazy var rowCount: Int = {
        return Int(ceil(Double(Double(gridItems.count)/Double(columns))))
    }()
    
    lazy var gridHeight: CGFloat = {
        return CGFloat(Double(rowCount) * height)
    }()
}
