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
    var showSelectServerBlock: (() -> Void)?

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

        if DebugScreenConfiguration.shared.selectServerActionsProvider != nil {
            adapter?.addCellGenerator(createSelectServerGenerator())
        }

        if let featureToggles = DebugScreenConfiguration.shared.featureToggleActionsProvider?.actions() {
            featureToggles.forEach {
                adapter?.addCellGenerator(createSwitcherGenerator(action: $0))
            }
        }

        adapter?.forceRefill()
    }

    func createCacheClearerGenerator(actions: [CacheCleanerAction]) -> TableCellGenerator {
        let generator = BaseCellGenerator<TextTableCell>(with: TextTableCell.Model(title: "Clear application data"))
        generator.didSelectEvent += { [weak self] in
            self?.showCacheClearingOptionsBlock?(actions)
        }

        return generator
    }

    func createSelectServerGenerator() -> TableCellGenerator {
        let generator = BaseCellGenerator<TextTableCell>(with: TextTableCell.Model(title: "Select server"))
        generator.didSelectEvent += { [weak self] in
            self?.showSelectServerBlock?()
        }

        return generator
    }

    func createSwitcherGenerator(action: FeatureToggleModel) -> TableCellGenerator {
        let generator = SwitcherTableCellGenerator(with: action)
        generator.didChangeSwitch = { newValue in
            DebugScreenConfiguration.shared.featureToggleActionsProvider?.handleAction(with: action.text, newValue: newValue)
        }
        return generator
    }

}
