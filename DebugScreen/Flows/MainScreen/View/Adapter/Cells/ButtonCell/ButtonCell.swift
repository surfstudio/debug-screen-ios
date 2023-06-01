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
        configureActionButton(with: model.actionType)
    }

}

// MARK: - Appearance

private extension ButtonCell {

    func configureAppearance() {
        selectionStyle = .none
        configureActionButton()
    }

    func configureActionButton(with type: ActionType = .primary) {
        actionButton.clipsToBounds = true
        actionButton.layer.cornerRadius = 12

        actionButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
        actionButton.setTitleColor(type.titleColor, for: .normal)
        actionButton.setTitleColor(type.titleColor, for: .highlighted)
        actionButton.setTitleColor(type.titleColor, for: .disabled)

        actionButton.set(backgroundColor: type.backgroundColor, for: .normal)
        actionButton.set(backgroundColor: type.highlightedBackgroundColor, for: [.highlighted, .selected])
        actionButton.setBackgroundImage(UIImage(color: type.highlightedBackgroundColor), for: [.highlighted, .selected])
    }

}

// MARK: - Actions

private extension ButtonCell {

    @IBAction func didTapButton(_ sender: UIButton) {
        onAction?()
    }

}
