//
//  BenchmarkCell.swift
//  Otus
//
//  Created by Олег Иванов on 13/06/2019.
//  Copyright © 2019 Олег Иванов. All rights reserved.
//

import UIKit

class BenchmarkCell: UICollectionViewCell {

    static let reuseID = String(describing: BenchmarkCell.self)
    static let nib = UINib(nibName: String(describing: BenchmarkCell.self), bundle: nil)
    
    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet private weak var timerImageView: UIImageView!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private var pieChartVeiw: PieChartVeiw!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .white
        clipsToBounds = true
        layer.cornerRadius = 6
        dateLabel.font = UIFont.systemFont(ofSize: 17)
        dateLabel.textAlignment = .center
        
        pieChartVeiw.segments = [
            Segment(color: UIColor.red, title: "red"),
            Segment(color: UIColor.blue, title: "blue"),
            Segment(color: UIColor.orange, title: "orange"),
            Segment(color: UIColor.brown, title: "brown"),
            Segment(color: UIColor.green, title: "green")
        ]
    }
    
    func update(date: String, isRun: Bool) {
        if isRun {
            timerImageView.image = UIImage.init(named: "stop")
            pieChartVeiw.show()
        } else {
            timerImageView.image = UIImage.init(named: "run")
            pieChartVeiw.hide()
        }
        dateLabel.text = date
    }
}
