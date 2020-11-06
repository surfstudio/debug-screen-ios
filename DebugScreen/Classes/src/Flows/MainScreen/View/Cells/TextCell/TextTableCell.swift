//
//  TextTableCell.swift
//  DebugScreen
//
//  Created by Anton Shelar on 03.11.2020.
//

import UIKit
import ReactiveDataDisplayManager

class TextTableCell: UITableViewCell, SelectableItem {

    // MARK: - Public properties

    var didSelectEvent = BaseEvent<Void>()

    // MARK: - Private properties

    @IBOutlet private weak var titleLabel: UILabel!

    struct Model {
        let title: String
    }

}

// MARK: - Configurable

extension TextTableCell: Configurable {

    func configure(with model: Model) {
        titleLabel.text = model.title
    }

}
