//
//  SelectionTableCell.swift
//  DebugScreen
//
//  Created by Anton Shelar on 03.11.2020.
//

import UIKit

/// Cell with status and placeholder for url
final class SelectionTableCell: UITableViewCell {

    // MARK: - IBOutlet

    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var url: UILabel!
    @IBOutlet private weak var status: UILabel!

}

// MARK: - Configurable

extension SelectionTableCell {

    func configure(with model: SelectServerAction) {
        title.text = model.title
        configureURL(url: model.url?.absoluteString)
        configureStatus(isActive: model.isActive)
    }

    func configureURL(url: String?) {
        self.url.text = url
        self.url.font = .systemFont(ofSize: 13)
        self.url.textColor = .darkGray
    }

    func configureStatus(isActive: Bool) {
        status.text = (isActive ? L10n.SelectionTableCell.statusTitle : nil)
        status.font = .systemFont(ofSize: 15, weight: .bold)
        status.textColor = .systemGreen
    }

}
