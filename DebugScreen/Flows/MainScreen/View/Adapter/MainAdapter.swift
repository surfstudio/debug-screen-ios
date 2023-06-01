//
//  MainAdapter.swift
//  DebugScreen
//
//  Created by Svetlana Gladysheva on 29.04.2022.
//

import UIKit

final class MainAdapter: NSObject {

    // MARK: - Constants

    private enum Constants {
        static let sectionFooterHeight: CGFloat = 4
    }

    // MARK: - Properties

    var onOpenActionsList: ((ActionsList) -> Void)?
    var onSelectableTextTap: ((CopiedText) -> Void)?

    // MARK: - Private Properties

    private weak var tableView: UITableView?
    private var sections: [TableSection] = []

    // MARK: - Initialization

    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        configureTableView()
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

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let section = sections[safe: indexPath.section],
            let block = section.blocks[safe: indexPath.row]
        else {
            return UITableViewCell()
        }

        switch block {
        case .action(let model):
            let cellModel = ButtonCellModel(title: model.title, actionType: model.type)
            return configureButtonCell(tableView, indexPath: indexPath, model: cellModel, buttonAction: model.block)
        case .actionsList(let model):
            let cellModel = ButtonCellModel(title: model.title)
            let buttonAction: (() -> Void)? = { [weak self] in
                self?.onOpenActionsList?(model)
            }

            return configureButtonCell(tableView, indexPath: indexPath, model: cellModel, buttonAction: buttonAction)
        case .toggle(let model):
            return configureSwitcherCell(tableView, indexPath: indexPath, model: model)
        case .copiedText(let model):
            return configureSelectableTextCell(tableView, indexPath: indexPath, title: model.title)
        case .selectionList(let model):
            return configureSelectorCell(tableView, indexPath: indexPath, model: model)
        }
    }

}

// MARK: - UITableViewDelegate

extension MainAdapter: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let section = sections[safe: section] else {
            return nil
        }

        let headerView = HeaderView()
        headerView.configure(with: section.title)

        return headerView
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return Constants.sectionFooterHeight
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        guard
            let section = sections[safe: indexPath.section],
            let block = section.blocks[safe: indexPath.row],
            case let MainTableBlock.copiedText(model) = block
        else {
            return
        }

        onSelectableTextTap?(model)
    }

}

// MARK: - Private Methods

private extension MainAdapter {

    func configureTableView() {
        guard let tableView = tableView else {
            return
        }

        tableView.registerNib(ButtonCell.self)
        tableView.registerNib(SwitcherCell.self)
        tableView.registerNib(SelectorCell.self)
        tableView.registerNib(CopiedTextCell.self)

        tableView.delegate = self
        tableView.dataSource = self
    }

    func configureButtonCell(_ tableView: UITableView,
                             indexPath: IndexPath,
                             model: ButtonCellModel,
                             buttonAction: (() -> Void)? = nil) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(ButtonCell.self, indexPath: indexPath) else {
            return UITableViewCell()
        }

        cell.configure(with: model)
        cell.onAction = buttonAction

        return cell
    }

    func configureSwitcherCell(_ tableView: UITableView,
                               indexPath: IndexPath,
                               model: FeatureToggle) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(SwitcherCell.self, indexPath: indexPath) else {
            return UITableViewCell()
        }

        cell.configure(with: model)
        cell.onSwitch = { value in
            var updatedModel = model
            updatedModel.isEnabled = value
        }

        return cell
    }

    func configureSelectorCell(_ tableView: UITableView,
                               indexPath: IndexPath,
                               model: SelectionList) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(SelectorCell.self, indexPath: indexPath) else {
            return UITableViewCell()
        }

        cell.configure(with: model)
        cell.onSelectItem = { selectedItem in
            var updatedModel = model
            updatedModel.selectedItem = selectedItem
        }

        return cell
    }

    func configureSelectableTextCell(_ tableView: UITableView,
                                     indexPath: IndexPath,
                                     title: String) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(CopiedTextCell.self, indexPath: indexPath) else {
            return UITableViewCell()
        }

        cell.configure(with: title)
        return cell
    }

}
