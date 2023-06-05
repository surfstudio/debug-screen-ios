//
//  ButtonCell.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 31.05.2023.
//

import UIKit

final class ButtonCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet private weak var actionButton: UIButton!

    // MARK: - Properties

    var onAction: (() -> Void)?

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }

    // MARK: - Methods

    func configure(with model: ButtonCellModel) {
        actionButton.setTitleForAllState(model.title)
        actionButton.configure(type: model.actionType)
    }

}

// MARK: - Appearance

private extension ButtonCell {

    func configureAppearance() {
        selectionStyle = .none
    }

}

// MARK: - Actions

private extension ButtonCell {

    @IBAction func didTapButton(_ sender: UIButton) {
        onAction?()
    }

}
