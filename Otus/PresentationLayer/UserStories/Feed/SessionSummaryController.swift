//
//  SessionSummaryController.swift
//  Otus
//
//  Created by Олег Иванов on 13/06/2019.
//  Copyright © 2019 Олег Иванов. All rights reserved.
//

import UIKit

class SessionSummaryController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .green
    }
}

extension SessionSummaryController: ViewControllerable {
    static func storyBoardName() -> String {
        return "Feed"
    }
}
