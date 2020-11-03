//
//  MainModulePresenter.swift
//  DebugScreen
//
//  Created by Anton Shelar on 29.10.2020.
//

import Foundation
import ReactiveDataDisplayManager

final class MainModulePresenter: MainModuleOutput {

    // MARK: - MainModuleOutput

    var closeModuleBlock: (() -> Void)?
    var showCacheClearingOptionsBlock: (([CacheCleanerAction]) -> Void)?

    weak var view: MainViewInput?

    // MARK: - Private properties

    private var adapter: BaseTableDataDisplayManager?
}

// MARK: - MainModuleInput

extension MainModulePresenter: MainModuleInput {
    
}

// MARK: - MainViewOutput

extension MainModulePresenter: MainViewOutput {

    func configureAdapter(tableView: UITableView) {
        adapter = BaseTableDataDisplayManager(collection: tableView)
        fillAdapter()
    }

    func didTapCloseButton() {
        closeModuleBlock?()
    }

}

// MARK: - Private methods

private extension MainModulePresenter {

    func fillAdapter() {
        adapter?.clearCellGenerators()

        if let actions: [CacheCleanerAction] = DebugScreenConfiguration.shared.cacheCleanerActionsProvider?.actions(),
           !actions.isEmpty {
            adapter?.addCellGenerator(createCacheClearerGenerator(actions: actions))
        }

        adapter?.forceRefill()
    }

    func createCacheClearerGenerator(actions: [CacheCleanerAction]) -> TableCellGenerator {
        let generator = BaseNonReusableCellGenerator<TextTableCell>(with: TextTableCell.Model(title: "Clear application data"))
        generator.didSelectEvent += { [weak self] in
            self?.showCacheClearingOptionsBlock?(actions)
        }

        return generator
    }
}
