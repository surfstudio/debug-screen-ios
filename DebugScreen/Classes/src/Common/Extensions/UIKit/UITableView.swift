//
//  UITableView.swift
//  DebugScreen
//
//  Created by Svetlana Gladysheva on 29.04.2022.
//

import UIKit

extension UITableView {

    // MARK: - Methods

    func registerNib(_ cellType: UITableViewCell.Type) {
        self.register(UINib(nibName: cellType.className,
                            bundle: Bundle.shared(for: cellType.self)),
                      forCellReuseIdentifier: cellType.className)
    }

    func dequeueReusableCell<Cell: UITableViewCell>(_ type: Cell.Type = Cell.self, indexPath: IndexPath) -> Cell? {
        return dequeueReusableCell(withIdentifier: Cell.className, for: indexPath) as? Cell
    }

}
