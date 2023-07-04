//
//  TwoLabelsCell.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 03.07.2023.
//

import UIKit

final class TwoLabelsCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }

    // MARK: - Methods

    func configure(with model: TwoLabelsCellModel) {
        titleLabel.text = model.title
        valueLabel.text = model.value
    }

}

// MARK: - Appearance

private extension TwoLabelsCell {

    func configureAppearance() {
        setDefaultStyle()
        configureTitleLabel()
        configureValueLabel()
    }

    func configureTitleLabel() {
        titleLabel.font = .systemFont(ofSize: 14, weight: .regular)
        titleLabel.textColor = Colors.Text.primary
        titleLabel.numberOfLines = 0
    }

    func configureValueLabel() {
        valueLabel.font = .systemFont(ofSize: 14, weight: .regular)
        valueLabel.textColor = Colors.Text.secondary
        valueLabel.numberOfLines = 0
    }

}
