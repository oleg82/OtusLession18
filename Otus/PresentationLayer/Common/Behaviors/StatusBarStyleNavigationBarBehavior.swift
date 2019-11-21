//
//  StatusBarStyleNavigationBarBehavior.swift
//  Otus
//
//  Created by Олег Иванов on 10/06/2019.
//  Copyright © 2019 Олег Иванов. All rights reserved.
//

import UIKit

class StatusBarStyleNavigationBarBehavior: ViewControllerLifecycleBehavior {
    func beforeAppearing(_ viewController: UIViewController) {
        if var vc = viewController as? StatusBarConfigurable {
            vc.statusBarStyle = .lightContent
            viewController.setNeedsStatusBarAppearanceUpdate()
        }
        viewController.navigationController?.navigationBar.barStyle = .black
    }
}

