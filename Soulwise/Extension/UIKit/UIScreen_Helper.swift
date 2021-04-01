//
//  UIScreen_Helper.swift
//  Soulwise
//
//  Created by apple on 30/03/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

extension UIScreen {
    private static let deviceIdiom = UIScreen.main.traitCollection.userInterfaceIdiom
    public  static let listMaxWidth: CGFloat = 550
    public  static let iPad = (UIScreen.deviceIdiom == .pad)
    public  static let iPhone = (UIScreen.deviceIdiom == .phone)
    public  static let iPhoneSE =  (UIScreen.main.nativeBounds.height == 1136) //IPHONE 5,5S,5C
    
    public static func listAllowedWidth() -> CGFloat {
        let screenWidth = UIScreen.main.bounds.size.width
        let allowedW: CGFloat = screenWidth <= UIScreen.listMaxWidth ? screenWidth : UIScreen.listMaxWidth
        return allowedW
    }
    
    static var isLandscape: Bool {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.windows
                .first?
                .windowScene?
                .interfaceOrientation
                .isLandscape ?? false
        } else {
            return UIApplication.shared.statusBarOrientation.isLandscape
        }
    }
    
    enum SafeAreaInset {
        case top
        case bottom
        
        func height() -> CGFloat {
            return  safeAreaValue()
        }
        
        func safeAreaValue() -> CGFloat {
            switch self {
            case .top:
                return UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0.0
            case .bottom:
                return UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0.0
            }
        }
    }
}
