//
//  CopiedTextCell.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 31.05.2023.
//

import UIKit

final class CopiedTextCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet weak var titleLabel: UILabel!

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

private extension CopiedTextCell {

    func configureAppearance() {
        accessoryType = .disclosureIndicator
        backgroundColor = Colors.Main.background
        configureTitleLabel()
    }

    func configureTitleLabel() {
        titleLabel.font = .systemFont(ofSize: 16, weight: .regular)
        titleLabel.textColor = Colors.Text.primary
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .left
    }

}
