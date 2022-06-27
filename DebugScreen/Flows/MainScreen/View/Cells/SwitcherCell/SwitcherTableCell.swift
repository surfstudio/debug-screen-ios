//
//  SwitcherTableCell.swift
//  DebugScreen
//
//  Created by Полина Полухина on 24.11.2020.
//

import UIKit

/// Cell with switcher in right side
final class SwitcherTableCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var switchControl: UISwitch!

    // MARK: - Properties

    var didChangeSwitch: ((Bool) -> Void)?

}

// MARK: - Actions

extension SwitcherTableCell {

    @IBAction func didChangeSwitchControl(_ sender: Any) {
        didChangeSwitch?(switchControl.isOn)
    }

}

// MARK: - Configurable

extension SwitcherTableCell {

    func configure(with model: FeatureToggleModel) {
        title.text = model.text
        title.font = .systemFont(ofSize: 17)
        switchControl.isOn = model.value
        selectionStyle = .none
    }

}
