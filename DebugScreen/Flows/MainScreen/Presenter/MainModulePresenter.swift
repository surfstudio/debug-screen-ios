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
    var didActionOptionsShowed: ((ActionsProviderModel) -> Void)?

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

    func selectServer(model: SelectServerActionModel) {
        DebugScreenConfiguration.shared.selectServerActionsProvider?
            .didSelectServer(model)

        let sections = createSections()
        view?.update(sections: sections)
    }

    func selectAction(model: ActionsProviderModel) {
        didActionOptionsShowed?(model)
    }
    
    func selectText(model: SelectableTextModel) {
        DebugScreenConfiguration.shared.selectableTextProvider?
            .didSelectText(model)
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
            let models = DebugScreenConfiguration.shared.actionsProvider?.makeActions(),
            !models.isEmpty
        {
            models.forEach { model in
                sections.append(.init(title: model.header,
                                      blocks: [.featureAction(models: model)]))
            }
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

        if let provider = DebugScreenConfiguration.shared.selectableTextProvider {
            let blocks = provider
                .texts()
                .map { MainTableBlock.selectText(model: $0) }
            sections.append(.init(title: L10n.MainPresenter.selectedTextTitle,
                                  blocks: blocks))
        }

        return sections
    }

}
