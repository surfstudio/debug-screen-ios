//
//  SelectedCell.swift
//  DebugScreen
//
//  Created by Евгений Васильев on 03.08.2022.
//

import UIKit

/// Cell with selected text
final class SelectedTextTableCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var title: UILabel!

}

// MARK: - Configurable

extension SelectedTextTableCell {

    func configure(with title: String) {
        self.title.text = title
        self.title.textAlignment = .left
        self.title.font = .systemFont(ofSize: 17)
    }

}
