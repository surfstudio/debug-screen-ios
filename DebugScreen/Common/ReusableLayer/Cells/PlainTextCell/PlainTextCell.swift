//
//  PlainTextCell.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 31.05.2023.
//

import UIKit

final class PlainTextCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet private weak var titleLabel: UILabel!

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }

    // MARK: - Methods

    func configure(with title: String) {
        titleLabel.text = title
    }

}

// MARK: - Appearance

private extension PlainTextCell {

    func configureAppearance() {
        configureContainer()
        configureTitleLabel()
    }

    func configureContainer() {
        accessoryType = .disclosureIndicator
        backgroundColor = Colors.Main.background
    }

    func configureTitleLabel() {
        titleLabel.font = .systemFont(ofSize: 16, weight: .regular)
        titleLabel.textColor = Colors.Text.primary
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .left
    }

}
