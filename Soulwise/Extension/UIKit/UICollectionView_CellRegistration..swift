//
//  UICollectionView_CellRegistration..swift
//  Soulwise
//
//  Created by apple on 30/03/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

extension UINib {
    
    convenience init(_ type:CVCellType){
        self.init(nibName:type.rawValue, bundle:nil)
    }
}

extension UICollectionView {
    func register(_ celltypes:[CVCellType]) {
        for type in celltypes {
            let nib = UINib.init(type)
            register(nib, forCellWithReuseIdentifier: type.rawValue)
        }
    }
    
    func register(_ type:CVHeaderFooterType, forSupplementaryKind:String) {
        let nib = UINib.init(nibName: type.rawValue, bundle: nil)
               register(nib, forSupplementaryViewOfKind: forSupplementaryKind, withReuseIdentifier: type.rawValue)
    }
}
