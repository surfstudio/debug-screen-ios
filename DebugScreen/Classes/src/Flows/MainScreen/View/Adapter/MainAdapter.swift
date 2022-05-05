//
//  MainAdapter.swift
//  DebugScreen
//
//  Created by Svetlana Gladysheva on 29.04.2022.
//

import UIKit

enum MainTableBlock {
    case featureToggle(model: FeatureToggleModel)
    case cacheCleaner(models: [CacheCleanerAction])
    case selectServer
}

final class MainAdapter: NSObject {

    // MARK: - Properties

    var onSelectServer: (() -> Void)?
    var onSelectCacheCleanerAction: (([CacheCleanerAction]) -> Void)?
    var onToggleFeatureAction: ((_ model: FeatureToggleModel, _ newValue: Bool) -> Void)?

    // MARK: - Private Properties

    private weak var tableView: UITableView?
    private var blocks: [MainTableBlock] = []

    // MARK: - Initialization

    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()

        tableView.registerNib(TextTableCell.self)
        tableView.registerNib(SwitcherTableCell.self)
        tableView.delegate = self
        tableView.dataSource = self
    }

    // MARK: - Methods

    func fill(with blocks: [MainTableBlock]) {
        self.blocks = blocks
        tableView?.reloadData()
    }

}

// MARK: - UITableViewDataSource

extension MainAdapter: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blocks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let block = blocks[safe: indexPath.row] else {
            return UITableViewCell()
        }

        switch block {
        case .featureToggle(let model):
            guard let cell = tableView.dequeueReusableCell(SwitcherTableCell.self, indexPath: indexPath) else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            cell.didChangeSwitch = { [weak self] newValue in
                self?.onToggleFeatureAction?(model, newValue)
            }
            return cell
        case .cacheCleaner:
            guard let cell = tableView.dequeueReusableCell(TextTableCell.self, indexPath: indexPath) else {
                return UITableViewCell()
            }
            cell.configure(with: "Clear application data")
            return cell
        case .selectServer:
            guard let cell = tableView.dequeueReusableCell(TextTableCell.self, indexPath: indexPath) else {
                return UITableViewCell()
            }
            cell.configure(with: "Select server")
            return cell
        }
    }

}

// MARK: - UITableViewDelegate

extension MainAdapter: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        guard let block = blocks[safe: indexPath.row] else {
            return
        }
        switch block {
        case .featureToggle:
            break
        case .cacheCleaner(let model):
            onSelectCacheCleanerAction?(model)
        case .selectServer:
            onSelectServer?()
        }
    }

}
