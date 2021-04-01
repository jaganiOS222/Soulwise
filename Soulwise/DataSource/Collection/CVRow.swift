//
//  CVCell.swift
//  Soulwise
//
//  Created by apple on 30/03/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class CVRow: NSObject {
    var type: CVCellType?
    var data: CVCellData?
    
    init(_ type: CVCellType, _ data: CVCellData) {
        self.type = type
        self.data = data
    }
}
