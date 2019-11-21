//
//  TimerNavigationBarBehavior.swift
//  Otus
//
//  Created by Олег Иванов on 10/06/2019.
//  Copyright © 2019 Олег Иванов. All rights reserved.
//

import UIKit

class TimerNavigationBarBehavior: ViewControllerLifecycleBehavior {
    private var timer: Timer?
    
    func beforeAppearing(_ viewController: UIViewController) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimed), userInfo: nil, repeats: true)
    }
    
    func beforeDisappearing(_ viewController: UIViewController) {
        timer?.invalidate()
    }
    
    @objc func runTimed() {
        print("BenchmarkController - \(Date())")
    }
}
