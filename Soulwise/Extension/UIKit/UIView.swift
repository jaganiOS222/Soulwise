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


@IBDesignable
class GradientView: UIView {
//FBFBFBFF
    @IBInspectable var startColor:   UIColor  = UIColor.init(red: 194, green: 160, blue: 251, alpha: 0.05) { didSet { updateColors() }}
    @IBInspectable var endColor:     UIColor = UIColor.init(hex: "#FBFBFBFF") { didSet { updateColors() }}
    @IBInspectable var startLocation: Double = 0.15 { didSet { updateLocations() }}
    @IBInspectable var endLocation:   Double = 1.0 { didSet { updateLocations() }}
    @IBInspectable var horizontalMode:  Bool = false { didSet { updatePoints() }}
    @IBInspectable var diagonalMode:    Bool = false { didSet { updatePoints() }}

    override public class var layerClass: AnyClass { CAGradientLayer.self }

    var gradientLayer: CAGradientLayer { layer as! CAGradientLayer }

    func updatePoints() {
        if horizontalMode {
            gradientLayer.startPoint = diagonalMode ? .init(x: 1, y: 0) : .init(x: 0, y: 0.5)
            gradientLayer.endPoint   = diagonalMode ? .init(x: 0, y: 1) : .init(x: 1, y: 0.5)
        } else {
            gradientLayer.startPoint = diagonalMode ? .init(x: 0, y: 0) : .init(x: 0.5, y: 0)
            gradientLayer.endPoint   = diagonalMode ? .init(x: 1, y: 1) : .init(x: 0.5, y: 1)
        }
    }
    
    func updateLocations() {
        gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]
    }
    
    func updateColors() {
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        updatePoints()
        updateLocations()
        updateColors()
    }
}
