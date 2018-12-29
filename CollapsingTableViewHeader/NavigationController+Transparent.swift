//
//  NavigationController+Transparent.swift
//  CollapsingTableViewHeader
//
//  Created by Arifin Firdaus on 12/29/18.
//  Copyright © 2018 Arifin Firdaus. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    func transparentNavBar(tintColor color: UIColor) {
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
        self.navigationBar.tintColor = color
    }
    
    func unTransparentNavBar(tintColor color: UIColor, barTintColor barTintColor: UIColor) {
        self.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationBar.shadowImage = nil
        self.navigationBar.isTranslucent = true
        self.navigationBar.tintColor = color
        self.navigationBar.barTintColor = barTintColor
    }
    
}
