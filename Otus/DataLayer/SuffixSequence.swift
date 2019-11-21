//
//  SuffixSequence.swift
//  Otus
//
//  Created by Олег Иванов on 17/07/2019.
//  Copyright © 2019 Олег Иванов. All rights reserved.
//

import Foundation

struct SuffixIterator: IteratorProtocol {
    let string: String
    let last: String.Index
    var offset: String.Index
    
    init(string: String) {
        self.string = string
        last = string.endIndex
        offset = string.startIndex
    }
    
    mutating func next() -> Substring? {
        guard offset < last else {
            return nil
        }
        
        let sub = string[offset..<last]
        string.formIndex(after: &offset)
        return sub
    }
}

struct SuffixSequence: Sequence {
    let string: String
    
    func makeIterator() -> SuffixIterator {
        return SuffixIterator(string: string)
    }
}
