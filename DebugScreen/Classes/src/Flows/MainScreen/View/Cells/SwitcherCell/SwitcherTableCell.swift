//
//  SwitcherTableCell.swift
//  DebugScreen
//
//  Created by Полина Полухина on 24.11.2020.
//

import UIKit
import ReactiveDataDisplayManager

class SwitcherTableCell: UITableViewCell {

    // MARK: - Public properties

    var didChangeSwitch: ((Bool) -> Void)?

    // MARK: - Private properties

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var switchControl: UISwitch!

    // MARK: - Actions

    @IBAction func didChangeSwitchControl(_ sender: Any) {
        didChangeSwitch?(switchControl.isOn)
    }

}

// MARK: - Configurable

extension SwitcherTableCell: Configurable {

    func configure(with model: FeatureToggleModel) {
        titleLabel.text = model.text
        switchControl.isOn = model.value
        selectionStyle = .none
    }

}
