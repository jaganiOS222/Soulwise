//
//  TableView_CellRegistration.swift
//  Soulwise
//
//  Created by apple on 30/03/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

extension UINib {
    
    convenience init(_ type: TBCellTypes) {
        self.init(nibName: type.rawValue, bundle: nil)
    }
}

extension UITableView {
    
    func register( _ celltypes:[TBCellTypes]) {
        for type in celltypes {
            let nib = UINib.init(type)
            self.register(nib, forCellReuseIdentifier: type.rawValue)
             
        }
    }
}
