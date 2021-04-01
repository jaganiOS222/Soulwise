//
//  CVSection.swift
//  Soulwise
//
//  Created by apple on 30/03/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class CVSection: NSObject {
    var data: Any?
    var rows: [CVRow] = []
    var columnCount: Int = 1
    
    init(_ data: Any?, _ rows: [CVRow], _ cols:Int? = 1) {
        self.data = data
        self.rows = rows
        self.columnCount = cols!
    }
}
