//
//  TextTableCell.swift
//  DebugScreen
//
//  Created by Anton Shelar on 03.11.2020.
//

import UIKit

final class TextTableCell: UITableViewCell {

    // MARK: - Private properties

    @IBOutlet private weak var title: UILabel!

}

// MARK: - Configurable

extension TextTableCell {

    func configure(with title: String) {
        self.title.text = title
    }

}
