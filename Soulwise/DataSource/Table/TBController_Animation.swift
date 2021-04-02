//
//  TBController_Animation.swift
//  Soulwise
//
//  Created by apple on 02/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

extension TBController {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        // animation to display cells
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 100, 10, 0)
        cell.layer.transform = rotationTransform
        cell.alpha = 0.5
        
        UIView.animate(withDuration: 1.0) {
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1.0
        }

    }
}


