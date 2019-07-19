//
//  UINavigationController+Ext.swift
//  FoodPinNavigationOOPCustomNavigation
//
//  Created by Ananchai Mankhong on 17/7/2562 BE.
//  Copyright © 2562 Ananchai Mankhong. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    open override var childForStatusBarStyle: UIViewController? {
        return topViewController
    }
    
}
