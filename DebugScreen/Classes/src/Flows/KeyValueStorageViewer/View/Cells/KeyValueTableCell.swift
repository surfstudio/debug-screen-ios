//
//  KeyValueTableCell.swift
//  DebugScreen
//
//  Created by Anton Shelar on 28.12.2020.
//

import UIKit

class KeyValueTableCell: UITableViewCell, CellProtocol {

    // MARK: - Model

    final class Model: CellViewModelProtocol {
        static let cellType: UIView.Type = KeyValueTableCell.self
        let key: String
        let value: String

        init(key: String, value: String) {
            self.key = key
            self.value = value
        }
    }

    // MARK: - Private Properties

    @IBOutlet private weak var keyLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!

    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()

        selectionStyle = .none
    }

    // MARK: - CellProtocol

    func setModel(_ model: Model) {
        keyLabel.text = "Key: \"\(model.key)\""
        valueLabel.text = "Value: \"\(model.value)\""
    }

}
