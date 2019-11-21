//
//  Services.swift
//  Otus
//
//  Created by Олег Иванов on 14/08/2019.
//  Copyright © 2019 Олег Иванов. All rights reserved.
//

import Foundation

class Services {
    
    static var feedProvider: FeedProvider = {
        return FeedProvider()
    }()
    
    static var algoProvider: AlgoProvider = {
        return AlgoProvider()
    }()
}
