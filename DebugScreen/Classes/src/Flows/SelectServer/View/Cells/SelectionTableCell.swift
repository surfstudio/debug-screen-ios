//
//  SelectionTableCell.swift
//  DebugScreen
//
//  Created by Anton Shelar on 03.11.2020.
//

import UIKit

class SelectionTableCell: UITableViewCell {

    // MARK: - Private properties

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var urlLabel: UILabel!
    @IBOutlet private weak var statusLabel: UILabel!
    
}

// MARK: - Configurable

extension SelectionTableCell {

    func configure(with model: SelectServerAction) {
        titleLabel.text = model.title
        urlLabel.text = model.url.absoluteString
        statusLabel.text = (model.isActive ? "Active" : nil)
    }

}
