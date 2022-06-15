//
//  SwitcherTableCell.swift
//  DebugScreen
//
//  Created by Полина Полухина on 24.11.2020.
//

import UIKit

final class SwitcherTableCell: UITableViewCell {

    // MARK: - Public properties

    var didChangeSwitch: ((Bool) -> Void)?

    // MARK: - IBOutlets

    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var switchControl: UISwitch!

    // MARK: - Actions

    @IBAction func didChangeSwitchControl(_ sender: Any) {
        didChangeSwitch?(switchControl.isOn)
    }

}

// MARK: - Configurable

extension SwitcherTableCell {

    func configure(with model: FeatureToggleModel) {
        title.text = model.text
        switchControl.isOn = model.value
        selectionStyle = .none
    }

}
