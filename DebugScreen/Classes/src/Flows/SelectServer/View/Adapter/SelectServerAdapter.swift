//
//  SelectServerAdapter.swift
//  DebugScreen
//
//  Created by Svetlana Gladysheva on 04.05.2022.
//

import UIKit

final class SelectServerAdapter: NSObject {

    // MARK: - Properties

    var onSelectServer: ((SelectServerAction) -> Void)?

    // MARK: - Private Properties

    private weak var tableView: UITableView?
    private var models: [SelectServerAction] = []

    // MARK: - Initialization

    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()

        tableView.registerNib(SelectionTableCell.self)
        tableView.delegate = self
        tableView.dataSource = self
    }

    // MARK: - Methods

    func fill(with models: [SelectServerAction]) {
        self.models = models
        tableView?.reloadData()
    }

}

// MARK: - UITableViewDataSource

extension SelectServerAdapter: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let model = models[safe: indexPath.row] else {
            return UITableViewCell()
        }

        guard let cell = tableView.dequeueReusableCell(SelectionTableCell.self, indexPath: indexPath) else {
            return UITableViewCell()
        }
        cell.configure(with: model)
        return cell
    }

}

// MARK: - UITableViewDelegate

extension SelectServerAdapter: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let model = models[safe: indexPath.row] else {
            return
        }
        onSelectServer?(model)
    }

}
