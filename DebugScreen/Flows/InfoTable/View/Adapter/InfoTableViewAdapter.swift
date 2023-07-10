//
//  InfoTableViewAdapter.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 03.07.2023.
//

import UIKit

final class InfoTableViewAdapter: NSObject {

    // MARK: - Private Properties

    private weak var tableView: UITableView?
    private var sections: [InfoTableSection] = []

    // MARK: - Initialization

    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        configureTableView()
    }

    // MARK: - Methods

    func fill(with sections: [InfoTableSection]) {
        self.sections = sections
        tableView?.reloadData()
    }

}

// MARK: - UITableViewDataSource

extension InfoTableViewAdapter: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[safe: section]?.items.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let section = sections[safe: indexPath.section],
            let item = section.items[safe: indexPath.row]
        else {
            return UITableViewCell()
        }

        return configureItemCell(tableView, indexPath: indexPath, item: item)
    }

}

// MARK: - UITableViewDelegate

extension InfoTableViewAdapter: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let section = sections[safe: section] else {
            return nil
        }

        let model = HeaderViewModel(
            text: section.title?.uppercased(),
            textColor: Colors.Text.secondary,
            backgroundColor: .clear,
            font: .systemFont(ofSize: 14)
        )

        let headerView = HeaderView()
        headerView.configure(with: model)

        return headerView
    }

}

// MARK: - Private Methods

private extension InfoTableViewAdapter {

    func configureTableView() {
        guard let tableView = tableView else {
            return
        }

        tableView.registerNib(TwoLabelsCell.self)
        tableView.dataSource = self
        tableView.delegate = self
    }

    func configureItemCell(_ tableView: UITableView,
                           indexPath: IndexPath,
                           item: InfoTableItem) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(TwoLabelsCell.self, indexPath: indexPath) else {
            return UITableViewCell()
        }

        let cellModel = TwoLabelsCellModel(title: item.key, value: item.value)
        cell.configure(with: cellModel)

        return cell
    }

}
