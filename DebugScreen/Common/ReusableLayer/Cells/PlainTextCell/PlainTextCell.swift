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
        backgroundColor = DebugScreenConfiguration.shared.colorScheme.backgroundColor
    }

    func configureTitleLabel() {
        titleLabel.font = .systemFont(ofSize: 16, weight: .regular)
        titleLabel.textColor = DebugScreenConfiguration.shared.colorScheme.textColor
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .left
    }

}
