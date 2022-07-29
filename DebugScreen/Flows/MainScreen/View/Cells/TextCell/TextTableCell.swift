//
//  TextTableCell.swift
//  DebugScreen
//
//  Created by Anton Shelar on 03.11.2020.
//

import UIKit

/// Usually cell with label in center
final class TextTableCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet private weak var title: UILabel!

}

// MARK: - Configurable

extension TextTableCell {

    func configure(with title: String) {
        self.title.text = title
        self.title.font = .systemFont(ofSize: 17)
    }

}
