//
//  TableUnit.swift
//  DebugScreen
//
//  Created by Anton Shelar on 28.12.2020.
//

import UIKit.UITableViewCell


protocol TableUnitItem {
    var reuseIdentifier: String { get }

    func bindToCell(_ cell: UITableViewCell)
    func cellModel() -> CellViewModelProtocol
}


final class TableCellUnit<T: CellProtocol & UITableViewCell>: CellUnit<T>, TableUnitItem {
    func bindToCell(_ _cell: UITableViewCell) {
        guard let cell: T = _cell as? T else {
            assertionFailure("Invalid cell type! Expected '\(T.self)', actual '\(_cell.self)'")
            return
        }

        cell.setModel(self.model)
    }

    func cellModel() -> CellViewModelProtocol {
        return self.model
    }

    static func create(_ model: T.Model) -> TableCellUnit<T> {
        return TableCellUnit<T>(model: model,
                                reuseIdentifier: type(of: model).reuseIdentifier,
                                cellType: type(of: model).cellType,
                                bundle: type(of: model).bundle)
    }
}
