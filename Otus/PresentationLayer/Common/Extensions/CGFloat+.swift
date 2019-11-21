//
//  CGFloat+.swift
//  Otus
//
//  Created by Олег Иванов on 15/07/2019.
//  Copyright © 2019 Олег Иванов. All rights reserved.
//

import UIKit

extension CGFloat {
    func toRadians() -> CGFloat {
        return self * CGFloat(Double.pi) / 180.0
    }
}
