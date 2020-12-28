//
//  SelectionTableCell.swift
//  DebugScreen
//
//  Created by Anton Shelar on 03.11.2020.
//

import UIKit

class SelectionTableCell: UITableViewCell, CellProtocol {

    // MARK: - Model

    final class Model: CellViewModelProtocol, CellViewModelSelectable {
        static let cellType: UIView.Type = SelectionTableCell.self
        var didSelect: (() -> Void)?
        let title: String?
        let url: URL?
        let isSelected = SingleObservable<Bool>(false)

        init(title: String?, url: URL?) {
            self.title = title
            self.url = url
        }
    }

    // MARK: - Private properties

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var urlLabel: UILabel!
    @IBOutlet private weak var statusLabel: UILabel!

    // MARK: - CellProtocol

    func setModel(_ model: Model) {
        titleLabel.text = model.title
        urlLabel.text = model.url?.absoluteString

        model.isSelected.addObserver(self) { [weak self] (isSelected: Bool) in
            self?.statusLabel.text = (isSelected ? "Active" : nil)
        }
    }

}
