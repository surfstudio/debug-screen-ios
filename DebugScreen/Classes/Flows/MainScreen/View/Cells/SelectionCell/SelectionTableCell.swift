//
//  SelectionTableCell.swift
//  DebugScreen
//
//  Created by Anton Shelar on 03.11.2020.
//

import UIKit

final class SelectionTableCell: UITableViewCell {

    // MARK: - Private properties

    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var url: UILabel!
    @IBOutlet private weak var status: UILabel!
    
}

// MARK: - Configurable

extension SelectionTableCell {

    func configure(with model: SelectServerAction) {
        title.text = model.title
        url.text = model.url.absoluteString
        status.text = (model.isActive ? "Active" : nil)
    }

}
