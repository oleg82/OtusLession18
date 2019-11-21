//
//  ProfileController.swift
//  Otus
//
//  Created by Олег Иванов on 05/06/2019.
//  Copyright © 2019 Олег Иванов. All rights reserved.
//

import UIKit

class ProfileController: UIViewController, StatusBarConfigurable {
    var statusBarStyle: UIStatusBarStyle = .default
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return statusBarStyle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBehaviors(behaviors: [BackgroundColorNavigationBarBehavior(), StatusBarStyleNavigationBarBehavior()])
    }
}
