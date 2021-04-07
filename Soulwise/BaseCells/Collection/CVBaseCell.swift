//
//  CVBaseCell.swift
//  Soulwise
//
//  Created by apple on 30/03/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit
typealias ValueHandler = (Any?) -> Void

class CVBaseCell: UICollectionViewCell {
    var changeHandler: ValueHandler?
    var actionHandler: ActionHandler?

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var containerViewWidth: NSLayoutConstraint!
    @IBOutlet weak var header:      UILabel!
    @IBOutlet weak var subHeader:   UILabel!
    @IBOutlet weak var iconView:    UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        customize()
        containerView.dropShadow(radius: 4, opacity: 0.3)
    }
    
    func customize() { }
    
    func prepareToBindData() { }
    
    func onError() { }
    
    func bindDataInternal(data: CVCellData) { }
    
    func bindData(data: CVCellData) {
        prepareToBindData()
        bindDataInternal(data: data)
        if let error = data.hasError,
            error == true {
            onError()
        }
    }
}

extension CVBaseCell {
    
    func notifyValueHandler(_ value: Any?) {
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
