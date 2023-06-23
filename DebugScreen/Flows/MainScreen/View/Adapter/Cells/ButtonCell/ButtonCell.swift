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

    // MARK: - Private Properties

    private var style: ActionStyle?

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        guard let style = style else {
            return
        }

        actionButton.configure(style: style)
    }

    // MARK: - Methods

    func configure(with model: ButtonCellModel) {
        actionButton.setTitleForAllState(model.title)
        actionButton.configure(style: model.actionStyle)

        style = model.actionStyle
    }

}

// MARK: - Appearance

private extension ButtonCell {

    func configureAppearance() {
        setDefaultStyle()
    }

}

// MARK: - Actions

private extension ButtonCell {

    @IBAction func didTapButton(_ sender: UIButton) {
        onAction?()
    }

}
