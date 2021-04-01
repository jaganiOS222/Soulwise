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
    @IBOutlet weak var header:      UILabel!
    @IBOutlet weak var subHeader:   UILabel!
    @IBOutlet weak var iconView:    UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        customize()
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
    
}
