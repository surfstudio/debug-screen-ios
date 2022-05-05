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

    weak var view: MainViewInput?
}

// MARK: - MainModuleInput

extension MainModulePresenter: MainModuleInput {
    
}

// MARK: - MainViewOutput

extension MainModulePresenter: MainViewOutput {

    func viewLoaded() {
        let tableSections = createTableSections()
        view?.setupInitialState(sections: tableSections)
    }

    func didTapCloseButton() {
        closeModuleBlock?()
    }

    func serverSelected(action: SelectServerAction) {
        DebugScreenConfiguration.shared.selectServerActionsProvider?
            .didSelectServer(action)

        let tableSections = createTableSections()
        view?.update(sections: tableSections)
    }

    func clearCacheSelected(actions: [CacheCleanerAction]) {
        showCacheClearingOptionsBlock?(actions)
    }

    func featureToggled(model: FeatureToggleModel, newValue: Bool) {
        DebugScreenConfiguration.shared.featureToggleActionsProvider?
            .handleAction(with: model.text, newValue: newValue)
    }

}

// MARK: - Private Methods

private extension MainModulePresenter {

    func createTableSections() -> [TableSection] {
        var tableSections = [TableSection]()
        if let actions: [CacheCleanerAction] = DebugScreenConfiguration.shared.cacheCleanerActionsProvider?.actions(),
           !actions.isEmpty {
            tableSections.append(TableSection(
                title: "Clear data",
                blocks: [.cacheCleaner(models: actions)]
            ))
        }

        if let provider = DebugScreenConfiguration.shared.selectServerActionsProvider {
            let servers = provider.servers()
            let tableBlocks = servers.map { server in
                MainTableBlock.selectServer(model: server)
            }
            tableSections.append(TableSection(title: "Select server", blocks: tableBlocks))
        }

        if let featureToggles = DebugScreenConfiguration.shared.featureToggleActionsProvider?.actions() {
            let tableBlocks = featureToggles.map { featureToggle in
                MainTableBlock.featureToggle(model: featureToggle)
            }
            tableSections.append(TableSection(title: "Features", blocks: tableBlocks))
        }
        return tableSections
    }

}
