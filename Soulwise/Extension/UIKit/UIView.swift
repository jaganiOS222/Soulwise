//
//  UIView.swift
//  Soulwise
//
//  Created by apple on 31/03/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit


extension UIView {
    
    func dropShadow(radius: CGFloat? = 8.0, opacity: Float? = 0.4) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        layer.shadowOpacity = opacity!
        layer.shadowRadius = radius!
    }
    
    @IBInspectable
     var cornerRadius: CGFloat {
         get {
             return layer.cornerRadius
         }
         set {
             layer.cornerRadius = newValue
             layer.masksToBounds = newValue > 0
         }
     }
     
     @IBInspectable
     var borderWidth: CGFloat {
         get {
             return layer.borderWidth
         }
         set {
             layer.borderWidth = newValue
         }
     }
     
     @IBInspectable
     var borderColor: UIColor? {
         get {
             let color = UIColor.init(cgColor: layer.borderColor!)
             return color
         }
         set {
             layer.borderColor = newValue?.cgColor
         }
     }
}
