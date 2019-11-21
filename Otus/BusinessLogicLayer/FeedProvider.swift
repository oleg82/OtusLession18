//
//  FeedProvider.swift
//  Otus
//
//  Created by Олег Иванов on 13/06/2019.
//  Copyright © 2019 Олег Иванов. All rights reserved.
//

import Foundation

struct FeedProvider {
    func get() -> [(SuffixSequence, String)] {
        return AlgoProvider().all.map { (SuffixSequence(string: $0), $0) }.sorted { $0.1 < $1.1 }
    }
    
    func feedMockData() -> [FeedData] {
        return [
            FeedData(name: "Array"),
            FeedData(name: "Set"),
            FeedData(name: "Dictionary")
        ]
    }

}
