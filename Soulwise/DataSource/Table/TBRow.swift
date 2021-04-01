//
//  TBRow.swift
//  Soulwise
//
//  Created by apple on 30/03/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class TBRow {
    var cellType:TBCellTypes?
    var rowData:TBRowData?
    
    init(_ cellType:TBCellTypes?, _ rowData:TBRowData?) {
        self.cellType = cellType
        self.rowData = rowData
    }
}
