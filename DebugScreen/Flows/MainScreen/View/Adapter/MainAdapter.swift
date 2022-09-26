//
//  MainAdapter.swift
//  DebugScreen
//
//  Created by Svetlana Gladysheva on 29.04.2022.
//

import UIKit

final class MainAdapter: NSObject {

    // MARK: - Properties

    var onSelectServer: ((SelectServerActionModel) -> Void)?
    var onSelectAction: ((ActionsProviderModel) -> Void)?
    var onSelectText: ((SelectableTextModel) -> Void)?
    var onToggleFeatureAction: ((_ model: FeatureToggleModel, _ newValue: Bool) -> Void)?

    // MARK: - Private Properties

    private weak var tableView: UITableView?
    private var sections: [TableSection] = []

    // MARK: - Initialization

    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()

        tableView.registerNib(TextTableCell.self)
        tableView.registerNib(SwitcherTableCell.self)
        tableView.registerNib(SelectionTableCell.self)
        tableView.registerNib(SelectedTextTableCell.self)
        tableView.delegate = self
        tableView.dataSource = self
    }

    // MARK: - Methods

    func fill(with sections: [TableSection]) {
        self.sections = sections
        tableView?.reloadData()
    }

}

// MARK: - UITableViewDataSource

extension MainAdapter: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[safe: section]?.blocks.count ?? 0
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[safe: section]?.title
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let section = sections[safe: indexPath.section],
            let block = section.blocks[safe: indexPath.row]
        else {
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
        case .featureAction(let model):
            guard let cell = tableView.dequeueReusableCell(TextTableCell.self, indexPath: indexPath) else {
                return UITableViewCell()
            }
            cell.configure(with: model.title)
            return cell
        case .selectServer(let model):
            guard let cell = tableView.dequeueReusableCell(SelectionTableCell.self, indexPath: indexPath) else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        case .selectText(model: let model):
            guard let cell = tableView.dequeueReusableCell(SelectedTextTableCell.self, indexPath: indexPath) else {
                return UITableViewCell()
            }
            cell.configure(with: model.title)
            return cell
        }
    }

}

// MARK: - UITableViewDelegate

extension MainAdapter: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        guard
            let section = sections[safe: indexPath.section],
            let block = section.blocks[safe: indexPath.row]
        else {
            return
        }

        switch block {
        case .selectText(let model):
            onSelectText?(model)
        case .featureAction(let model):
            onSelectAction?(model)
        case .selectServer(let model):
            onSelectServer?(model)
        case .featureToggle:
            break
        }
    }

}
