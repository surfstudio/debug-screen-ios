//
//  MainModulePresenter.swift
//  DebugScreen
//
//  Created by Anton Shelar on 29.10.2020.
//

import Foundation

final class MainModulePresenter: MainModuleOutput {

    // MARK: - MainModuleOutput

    var didModuleClosed: (() -> Void)?
    var didCacheClearingOptionsShowed: (([CacheCleanerAction]) -> Void)?

    // MARK: - Properties

    weak var view: MainViewInput?

}

// MARK: - MainModuleInput

extension MainModulePresenter: MainModuleInput { }

// MARK: - MainViewOutput

extension MainModulePresenter: MainViewOutput {

    func viewLoaded() {
        let sections = createSections()
        view?.setupInitialState(sections: sections)
    }

    func didTapCloseButton() {
        didModuleClosed?()
    }

    func selectServer(action: SelectServerAction) {
        DebugScreenConfiguration.shared.selectServerActionsProvider?
            .didSelectServer(action)

        let sections = createSections()
        view?.update(sections: sections)
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

    func createSections() -> [TableSection] {
        var sections = [TableSection]()
        if
            let actions = DebugScreenConfiguration.shared.cacheCleanerActionsProvider?.actions(),
            !actions.isEmpty
        {
            sections.append(.init(title: L10n.MainPresenter.clearDataTitle,
                                  blocks: [.cacheCleaner(models: actions)]))
        }

        if let provider = DebugScreenConfiguration.shared.selectServerActionsProvider {
            let blocks = provider
                .servers()
                .map { MainTableBlock.selectServer(model: $0) }
            sections.append(.init(title: L10n.MainPresenter.serverTitle,
                                  blocks: blocks))
        }

        if let featureToggles = DebugScreenConfiguration.shared.featureToggleActionsProvider?.actions() {
            let blocks = featureToggles.map { MainTableBlock.featureToggle(model: $0) }
            sections.append(.init(title: L10n.MainPresenter.featuresTitle,
                                  blocks: blocks))
        }
        return sections
    }

}
