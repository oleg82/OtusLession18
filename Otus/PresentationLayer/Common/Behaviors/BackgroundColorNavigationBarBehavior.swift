//
//  BackgroundColorNavigationBarBehavior.swift
//  Otus
//
//  Created by Олег Иванов on 10/06/2019.
//  Copyright © 2019 Олег Иванов. All rights reserved.
//

import UIKit

class BackgroundColorNavigationBarBehavior: ViewControllerLifecycleBehavior {
    func afterLoading(_ viewController: UIViewController) {
        viewController.view.backgroundColor = .black
    }
}

