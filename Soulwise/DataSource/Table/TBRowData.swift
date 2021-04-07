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
    var hideHeaderIcon:Bool? = true
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
    var hasError:      BoolRef?
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

class PrimitiveRef {
    
    var valueDidChange: (() -> Void)?
    var value: Any? {
        didSet(oldValue) {
            if nil != valueDidChange {
                if !isEqual(oldValue: oldValue) {
                    valueDidChange!()
                }
            }
        }
    }
    
    init(val: Any) {
        value = val
        onInit()
    }
    
    fileprivate func onInit() { }
    
    fileprivate func isEqual(oldValue: Any?) -> Bool {
        return false
    }
    
    func intValue() -> Int? {
        if let val = value as? Int {
            return val
        }
        
        return nil
    }
    
    func boolValue() -> Bool? {
        if let val = value as? Bool {
            return val
        }
        
        return nil
    }
    
    func stringValue() -> String? {
        if let val = value as? String {
            return val
        }
        
        return nil
    }
}

class BoolRef: PrimitiveRef {
    
    fileprivate override func onInit() {
        if let val = value as? Int {
            self.value = (val == 1) ? true : false
        }
        
    }
    
    func toggle() {
        if let val = value as? Bool {
            value = !val
        }
    }
    
    override func isEqual(oldValue: Any?) -> Bool {
        if let oldValue = oldValue as? Bool,
           let newValue = value as? Bool {
            return oldValue == newValue
        }
        return false
    }
}


