//
//  SelectionTableCell.swift
//  DebugScreen
//
//  Created by Anton Shelar on 03.11.2020.
//

import UIKit

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
        url.text = model.url?.absoluteString
        configureStatus(isActive: model.isActive)
    }
    
    func configureStatus(isActive: Bool) {
        status.text = (isActive ? "Active" : nil)
        status.font = .systemFont(ofSize: 15, weight: .bold)
        status.textColor = .systemGreen
    }

}
