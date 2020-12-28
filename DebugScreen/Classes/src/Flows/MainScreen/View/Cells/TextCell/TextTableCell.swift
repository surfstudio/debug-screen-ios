//
//  TextTableCell.swift
//  DebugScreen
//
//  Created by Anton Shelar on 03.11.2020.
//

import UIKit

final class TextTableCell: UITableViewCell, CellProtocol {

    // MARK: - Model

    final class Model: CellViewModelProtocol, CellViewModelSelectable {
        static let cellType: UIView.Type = TextTableCell.self
        var didSelect: (() -> Void)?
        let title: String?

        init(title: String?) {
            self.title = title
        }
    }

    // MARK: - Private properties

    @IBOutlet private weak var titleLabel: UILabel!

    // MARK: - CellProtocol

    func setModel(_ model: Model) {
        titleLabel.text = model.title
    }

}
