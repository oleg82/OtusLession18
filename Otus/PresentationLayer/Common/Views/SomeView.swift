//
//  SomeView.swift
//  Otus
//
//  Created by Олег Иванов on 04/06/2019.
//  Copyright © 2019 Олег Иванов. All rights reserved.
//

import UIKit

class SomeView: UIView {

    @IBOutlet private var titleLabel: UILabel! {
        didSet {
            titleLabel.font = .systemFont(ofSize: 18)
            titleLabel.text = "Выбор значения"
        }
    }

    @IBOutlet private var valueSwitch: UISwitch! {
        didSet {
            valueSwitch.isOn = false
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }

    private func configure() {
        let bundle = Bundle.main
        if
            let nib = bundle.loadNibNamed("SomeView", owner: self, options: nil),
            let view = nib[0] as? UIView
        {
            addSubview(view)
        }
    }
}
