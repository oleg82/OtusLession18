//
//  UINavigationController+.swift
//  Otus
//
//  Created by Олег Иванов on 05/06/2019.
//  Copyright © 2019 Олег Иванов. All rights reserved.
//

import UIKit

extension UINavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
}
