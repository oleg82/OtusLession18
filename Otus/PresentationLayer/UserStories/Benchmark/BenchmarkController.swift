//
//  BenchmarkController.swift
//  Otus
//
//  Created by Олег Иванов on 05/06/2019.
//  Copyright © 2019 Олег Иванов. All rights reserved.
//

import UIKit

class BenchmarkController: UIViewController {

    private class CellModel {
        var seconds = 0
        var timer: Timer? = nil
    }
    private var models = (0...2).map { _ in CellModel() }

    @IBOutlet private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addBehaviors(behaviors: [TimerNavigationBarBehavior()])
        self.collectionView.register(BenchmarkCell.nib, forCellWithReuseIdentifier: BenchmarkCell.reuseID)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        for i in 0..<models.count {
            let model = models[i]
            model.timer?.invalidate()
            model.timer = nil
            model.seconds = 0
            
            if let cell = collectionView.cellForItem(at: IndexPath.init(row: i, section: 0)) as? BenchmarkCell {
                cell.update(date: timeString(seconds: model.seconds), isRun: false)
            }
        }
    }

    @objc func runTimed(timer: Timer) {
        if let indexPath = timer.userInfo as? IndexPath,
            let cell = collectionView.cellForItem(at: indexPath) as? BenchmarkCell
        {
            let model = models[indexPath.row]
            if model.seconds == 59 {
                model.seconds = 0
            } else {
                model.seconds += 1
            }
            cell.update(date: timeString(seconds: model.seconds), isRun: true)
        }
    }
    
    private func timeString(seconds: Int) -> String {
        let minutes = seconds / 60 % 60
        let seconds = seconds % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }
}

extension BenchmarkController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BenchmarkCell.reuseID, for: indexPath) as! BenchmarkCell
        
        let model = models[indexPath.row]
        cell.update(date: timeString(seconds: model.seconds), isRun: model.timer != nil)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        if let cell = collectionView.cellForItem(at: indexPath) as? BenchmarkCell {
            let model = models[indexPath.row]
            let isRun: Bool
            if model.timer == nil {
                isRun = true
                model.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimed), userInfo: indexPath, repeats: true)
            } else {
                isRun = false
                model.timer?.invalidate()
                model.timer = nil
            }
            cell.update(date: timeString(seconds: model.seconds), isRun: isRun)
        }
    }
}
