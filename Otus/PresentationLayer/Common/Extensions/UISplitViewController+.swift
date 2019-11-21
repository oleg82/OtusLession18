//
//  UISplitViewController+.swift
//  Otus
//
//  Created by Олег Иванов on 05/06/2019.
//  Copyright © 2019 Олег Иванов. All rights reserved.
//

import UIKit

extension UISplitViewController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        if
            let tbvc = viewControllers.last as? UITabBarController,
            let nvc = tbvc.selectedViewController as? UINavigationController,
            let tvc = nvc.topViewController
        {
            return tvc.preferredStatusBarStyle
        } else {
            return .default
        }
    }
}
