//
//  SwitcherTableCell.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 31.05.2023.
//

import UIKit

final class SwitcherCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var switcher: UISwitch!

    // MARK: - Properties

    var onSwitch: ((Bool) -> Void)?

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }

    // MARK: - Methods

    func configure(with model: FeatureToggle) {
        titleLabel.text = model.title
        switcher.isOn = model.isEnabled
    }

}

// MARK: - Appearance

private extension SwitcherCell {

    func configureAppearance() {
        selectionStyle = .none
        configureSwitcher()
        configureTitleLabel()
    }

    func configureSwitcher() {
        switcher.onTintColor = Colors.Buttons.Primary.normalBackground
    }

    func configureTitleLabel() {
        titleLabel.font = .systemFont(ofSize: 16, weight: .regular)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
    }

}

// MARK: - Actions

private extension SwitcherCell {

    @IBAction func didChangeSwitcher(_ sender: UISwitch) {
        onSwitch?(switcher.isOn)
    }

}
