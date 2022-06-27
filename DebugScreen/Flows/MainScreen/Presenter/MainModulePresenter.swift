//
//  MainModulePresenter.swift
//  DebugScreen
//
//  Created by Anton Shelar on 29.10.2020.
//

import Foundation

final class MainModulePresenter: MainModuleOutput {

    // MARK: - Constants

    private enum Constants {
        static let clearDataTitle = "Clear data"
        static let serverTitle = "Select server"
        static let featuresTitle = "Features"
    }

    // MARK: - MainModuleOutput

    var didModuleClosed: (() -> Void)?
    var didCacheClearingOptionsShowed: (([CacheCleanerAction]) -> Void)?

    weak var view: MainViewInput?
}

// MARK: - MainModuleInput

extension MainModulePresenter: MainModuleInput { }

// MARK: - MainViewOutput

extension MainModulePresenter: MainViewOutput {

    func viewLoaded() {
        let tableSections = createTableSections()
        view?.setupInitialState(sections: tableSections)
    }

    func didTapCloseButton() {
        didModuleClosed?()
    }

    func selectServer(action: SelectServerAction) {
        DebugScreenConfiguration.shared.selectServerActionsProvider?
            .didSelectServer(action)

        let tableSections = createTableSections()
        view?.update(sections: tableSections)
    }

    func selectClearCache(actions: [CacheCleanerAction]) {
        didCacheClearingOptionsShowed?(actions)
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
                title: Constants.clearDataTitle,
                blocks: [.cacheCleaner(models: actions)]
            ))
        }

        if let provider = DebugScreenConfiguration.shared.selectServerActionsProvider {
            let servers = provider.servers()
            let tableBlocks = servers.map { server in
                MainTableBlock.selectServer(model: server)
            }
            tableSections.append(TableSection(title: Constants.serverTitle, blocks: tableBlocks))
        }

        if let featureToggles = DebugScreenConfiguration.shared.featureToggleActionsProvider?.actions() {
            let tableBlocks = featureToggles.map { featureToggle in
                MainTableBlock.featureToggle(model: featureToggle)
            }
            tableSections.append(TableSection(title: Constants.featuresTitle, blocks: tableBlocks))
        }
        return tableSections
    }

}
