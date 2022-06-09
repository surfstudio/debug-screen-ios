//
//  TextTableCell.swift
//  DebugScreen
//
//  Created by Anton Shelar on 03.11.2020.
//

import UIKit

class TextTableCell: UITableViewCell {

    // MARK: - Private properties

    @IBOutlet private weak var titleLabel: UILabel!

}

// MARK: - Configurable

extension TextTableCell {

    func configure(with title: String) {
        titleLabel.text = title
    }

}
