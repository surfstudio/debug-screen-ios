//
//  MainModulePresenter.swift
//  DebugScreen
//
//  Created by Anton Shelar on 29.10.2020.
//

import Foundation

final class MainModulePresenter: MainModuleOutput {

    // MARK: - MainModuleOutput

    var closeModuleBlock: (() -> Void)?
    var showCacheClearingOptionsBlock: (([CacheCleanerAction]) -> Void)?
    var showBugReportBlock: (() -> Void)?
    var showSelectServerBlock: (() -> Void)?
    var showLogsViewerBlock: (() -> Void)?
    var showKeyValueStorageSelector: (([KeyValueStorageDataProvider]) -> Void)?

    weak var view: MainViewInput?

    // MARK: - Private properties

    private let adapter = BaseTableManager()
}

// MARK: - MainModuleInput

extension MainModulePresenter: MainModuleInput { }

// MARK: - MainViewOutput

extension MainModulePresenter: MainViewOutput {

    func configureAdapter(tableView: UITableView) {
        adapter.bindTableView(tableView)
        fillAdapter()
    }

    func didTapCloseButton() {
        closeModuleBlock?()
    }

}

// MARK: - Private methods

private extension MainModulePresenter {

    func fillAdapter() {
        var items = [TableUnitItem]()

        if let actions: [CacheCleanerAction] = DebugScreenConfiguration.shared.cacheCleanerActionsProvider?.actions(),
           !actions.isEmpty {
            items.append(createCacheClearerUnit(actions: actions))
        }

        if DebugScreenConfiguration.shared.selectServerActionsProvider != nil {
            items.append(createSelectServerUnit())
        }

        items.append(createBugReportUnit())
        items.append(createViewLogsUnit())

        if let storages: [KeyValueStorageDataProvider] = DebugScreenConfiguration.shared.keyValueStoragesProvider?.storages(),
           !storages.isEmpty {
            items.append(createKeyValueStoragesViewerUnit(storages: storages))
        }

        if let featureToggles = DebugScreenConfiguration.shared.featureToggleActionsProvider?.actions() {
            featureToggles.forEach {
                items.append(createFeatureToggleUnit(action: $0))
            }
        }

        adapter.setSections([items])
    }

    func createCacheClearerUnit(actions: [CacheCleanerAction]) -> TableUnitItem {
        let model = TextTableCell.Model(title: "Clear application data")
        let unit = TableCellUnit<TextTableCell>.create(model)

        model.didSelect = { [weak self] in
            self?.showCacheClearingOptionsBlock?(actions)
        }

        return unit
    }

    func createSelectServerUnit() -> TableUnitItem {
        let model = TextTableCell.Model(title: "Select server")
        let unit = TableCellUnit<TextTableCell>.create(model)

        model.didSelect = { [weak self] in
            self?.showSelectServerBlock?()
        }

        return unit
    }

    func createBugReportUnit() -> TableUnitItem {
        let model = TextTableCell.Model(title: "Report a bug")
        let unit = TableCellUnit<TextTableCell>.create(model)

        model.didSelect = { [weak self] in
            self?.showBugReportBlock?()
        }

        return unit
    }

    func createViewLogsUnit() -> TableUnitItem {
        let model = TextTableCell.Model(title: "Inspect logs")
        let unit = TableCellUnit<TextTableCell>.create(model)

        model.didSelect = { [weak self] in
            self?.showLogsViewerBlock?()
        }

        return unit
    }

    func createKeyValueStoragesViewerUnit(storages: [KeyValueStorageDataProvider]) -> TableUnitItem {
        let model = TextTableCell.Model(title: "Key-value storages")
        let unit = TableCellUnit<TextTableCell>.create(model)

        model.didSelect = { [weak self] in
            self?.showKeyValueStorageSelector?(storages)
        }

        return unit
    }

    func createFeatureToggleUnit(action: FeatureToggleModel) -> TableUnitItem {
        let model = SwitcherTableCell.Model(title: action.title, isOn: action.isEnabled) { (isEnabled: Bool) in
            DebugScreenConfiguration.shared.featureToggleActionsProvider?.handleAction(action)
        }

        action.didChangeEnabled = { [weak model] (isEnabled: Bool) in
            model?.isOn.value = isEnabled
        }

        let unit = TableCellUnit<SwitcherTableCell>.create(model)

        return unit
    }

}
