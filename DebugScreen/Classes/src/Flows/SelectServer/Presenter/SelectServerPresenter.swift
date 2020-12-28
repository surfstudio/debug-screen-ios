//
//  SelectServerPresenter.swift
//  DebugScreen
//
//  Created by Anton Shelar on 03.11.2020.
//

import Foundation

final class SelectServerPresenter: SelectServerModuleOutput {

    // MARK: - Public properties

    weak var view: SelectServerViewInput?

    // MARK: - Private properties

    private let provider: SelectServerActionsProvider
    private var adapter = BaseTableManager()

    // MARK: - Initialization

    init(provider: SelectServerActionsProvider) {
        self.provider = provider
    }

}

// MARK: - SelectServerModuleInput

extension SelectServerPresenter: SelectServerModuleInput { }

// MARK: - SelectServerViewOutput

extension SelectServerPresenter: SelectServerViewOutput {

    func configureAdapter(tableView: UITableView) {
        adapter.bindTableView(tableView)

        fillAdapter()
    }

}

// MARK: - Private methods

private extension SelectServerPresenter {

    func fillAdapter() {
        let actions: [SelectServerAction] = provider.servers()
        var units = [TableUnitItem]()

        for action in actions {
            let model = SelectionTableCell.Model(title: action.title, url: action.url)
            let unit = TableCellUnit<SelectionTableCell>.create(model)
            model.didSelect = { [weak self] in
                self?.provider.didSelectServer(action)
                self?.fillAdapter()
            }

            units.append(unit)
        }

        adapter.setSections([units])
    }

}
