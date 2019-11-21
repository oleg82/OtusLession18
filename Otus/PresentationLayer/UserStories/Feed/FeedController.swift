//
//  FeedController.swift
//  Otus
//
//  Created by Олег Иванов on 13/06/2019.
//  Copyright © 2019 Олег Иванов. All rights reserved.
//

import UIKit

class FeedController: UIViewController {
    
    private let feedData = Services.feedProvider.feedMockData()

    @IBOutlet private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // NOTE: 2.4 Сделать 1-3 теста на прог всех имен аглоритмов
        // Не понятно куда отображать - добавил вывод сюда
        
        func formattedTime(_ time: TimeInterval) -> String {
            let formatter = NumberFormatter()
            formatter.numberStyle = NumberFormatter.Style.decimal
            let digits = 6
            formatter.minimumFractionDigits = digits
            formatter.maximumFractionDigits = digits
            
            return formatter.string(from: time as NSNumber) ?? ""
        }

        func insertNewObjectAtBeginning() {
            var array = Services.algoProvider.all
            
            let time = Profiler.runClosureForTime() {
                array.insert("next", at: 0)
            }
            
            print("-- insertNewObjectAtBeginning = \(formattedTime(time))")
        }
        
        func insertNewObjectInMiddle() {
            var array = Services.algoProvider.all

            let half = Float(array.count) / Float(2)
            let middleIndex = Int(ceil(half))
            
            let time = Profiler.runClosureForTime() {
                array.insert("next", at: middleIndex)
            }
            
            print("-- insertNewObjectInMiddle = \(formattedTime(time))")
        }
        
        func addNewObjectAtEnd() {
            var array = Services.algoProvider.all
            
            let time = Profiler.runClosureForTime() {
               array.append("next")
            }
            
            print("-- addNewObjectAtEnd = \(formattedTime(time))")
        }


        insertNewObjectAtBeginning()
        insertNewObjectInMiddle()
        addNewObjectAtEnd()
    }

}

extension FeedController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "FeedCell")
        cell.textLabel?.text = feedData[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        var vc: UIViewController?
        
        if let currentCell = tableView.cellForRow(at: indexPath), let name = currentCell.textLabel?.text {
            switch name {
            case "Array":
                let storyboard = UIStoryboard(name: "DataStructures", bundle: nil)
                vc = storyboard.instantiateViewController(withIdentifier: "ArrayViewController")
            case "Set":
                let storyboard = UIStoryboard(name: "DataStructures", bundle: nil)
                vc = storyboard.instantiateViewController(withIdentifier: "SetViewController")
            case "Dictionary":
                let storyboard = UIStoryboard(name: "DataStructures", bundle: nil)
                vc = storyboard.instantiateViewController(withIdentifier: "DictionaryViewController")
            default:
                let vcSummary = SessionSummaryController.create()
                vcSummary.title = name
                
                vc = vcSummary
            }
        }
        
        if let pushViewController = vc {
            self.navigationController?.pushViewController(pushViewController, animated: true)
        }
    }
}

extension FeedController: ViewControllerable {
    static func storyBoardName() -> String {
        return "Feed"
    }
}
