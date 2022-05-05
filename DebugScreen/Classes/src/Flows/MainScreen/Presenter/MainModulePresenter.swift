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
    var showSelectServerBlock: (() -> Void)?

    weak var view: MainViewInput?
}

// MARK: - MainModuleInput

extension MainModulePresenter: MainModuleInput {
    
}

// MARK: - MainViewOutput

extension MainModulePresenter: MainViewOutput {

    func viewLoaded() {
        var tableBlocks = [MainTableBlock]()
        if let actions: [CacheCleanerAction] = DebugScreenConfiguration.shared.cacheCleanerActionsProvider?.actions(),
           !actions.isEmpty {
               tableBlocks.append(.cacheCleaner(models: actions))
        }

        if DebugScreenConfiguration.shared.selectServerActionsProvider != nil {
            tableBlocks.append(.selectServer)
        }

        if let featureToggles = DebugScreenConfiguration.shared.featureToggleActionsProvider?.actions() {
            featureToggles.forEach {
                tableBlocks.append(.featureToggle(model: $0))
            }
        }
        view?.setupInitialState(blocks: tableBlocks)
    }

    func didTapCloseButton() {
        closeModuleBlock?()
    }

    func serverSelected() {
        showSelectServerBlock?()
    }

    func clearCacheSelected(actions: [CacheCleanerAction]) {
        showCacheClearingOptionsBlock?(actions)
    }

    func featureToggled(model: FeatureToggleModel, newValue: Bool) {
        DebugScreenConfiguration.shared.featureToggleActionsProvider?.handleAction(with: model.text, newValue: newValue)
    }

}
