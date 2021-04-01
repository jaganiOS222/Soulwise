//
//  TBSection.swift
//  Soulwise
//
//  Created by apple on 30/03/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class TBSection {
    var data:Any?
    var rows:[TBRow] = []
    
    init(_ data:Any?, _ rows:[TBRow]) {
        self.data = data
        self.rows = rows
    }
}
