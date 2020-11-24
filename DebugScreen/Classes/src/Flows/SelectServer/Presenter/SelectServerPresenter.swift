//
//  SelectServerPresenter.swift
//  DebugScreen
//
//  Created by Anton Shelar on 03.11.2020.
//

import Foundation
import ReactiveDataDisplayManager

final class SelectServerPresenter: SelectServerModuleOutput {

    // MARK: - Public properties

    weak var view: SelectServerViewInput?

    // MARK: - Private properties

    private let provider: SelectServerActionsProvider
    private var adapter: BaseTableDataDisplayManager?

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
        adapter = BaseTableDataDisplayManager(collection: tableView)

        fillAdapter()
    }

}

// MARK: - Private methods

private extension SelectServerPresenter {

    func fillAdapter() {
        adapter?.clearCellGenerators()

        let actions: [SelectServerAction] = provider.servers()

        for action in actions {
            let generator = BaseCellGenerator<SelectionTableCell>(with: action)
            generator.didSelectEvent += { [weak self] in
                self?.provider.didSelectServer(action)
                self?.fillAdapter()
            }

            adapter?.addCellGenerator(generator)
        }

        adapter?.forceRefill()
    }

}
