//
//  JobQueue.swift
//  Otus
//
//  Created by Олег Иванов on 12/09/2019.
//  Copyright © 2019 Олег Иванов. All rights reserved.
//

import Foundation

class JobQueue {
    private var group = DispatchGroup()
    private var closures: [()->()] = []
    private var finishHandler: (()->())
    
    init(finishHandler: @escaping ()->()) {
        self.finishHandler = finishHandler
    }
    
    func add(closure: @escaping ()->()) {
        group.enter()
        closures.append(closure)

        if closures.count == 1 {
            group.notify(queue: .main) {
                self.finishHandler()
            }
        }
    }
    
    func run() {
        for closure in closures {
            closure()
            group.leave()
        }
    }
}

