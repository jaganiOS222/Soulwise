//
//  TBCell.swift
//  Soulwise
//
//  Created by apple on 30/03/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit
typealias ValueChangeHandler = (Any?) -> Void
typealias ActionHandler =      (CellAction) -> Void
typealias StateChangeHandler = () -> Void

class TBCell: UITableViewCell {
    @IBOutlet weak var header:      UILabel!
    @IBOutlet weak var subHeader:   UILabel!
    @IBOutlet weak var iconView:    UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = UIColor.clear
        customize()
        if(UIScreen.iPad) { customizeForiPad() }
    }
    
    var changeHandler: ValueChangeHandler?
    var actionHandler: ActionHandler?
    var stateHandler: StateChangeHandler?
    func bindDataInternal(data: TBRowData) { }
    func prepareToBindData() { }
    func customize() { }
    func customizeForiPad() { }
    
    func bindData(data: TBRowData) {
        prepareToBindData()
        bindDataInternal(data: data)
    }
    
}
extension TBCell {
    
    func notifyStateChange() {
        if let stateHandler = stateHandler {
            stateHandler()
        }
    }
    
    func notifyChangeHandler(_ value: Any?) {
        if let handler = changeHandler {
            handler(value)
        }
    }
    
    func notifyActionHandler(_ action: CellAction) {
        if let handler = actionHandler {
            handler(action)
        }
    }
}
