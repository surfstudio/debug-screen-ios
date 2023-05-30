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
    var onLogsFileOpen: ((String) -> Void)?
    var onAlertShow: ((String) -> Void)?
    var didModuleDismissed: (() -> Void)?

    // MARK: - Properties

    weak var view: MainViewInput?

    // MARK: - Deinitialization

    deinit {
        didModuleDismissed?()
    }

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
        model.block(newValue)
    }

}

// MARK: - Private Methods

private extension MainModulePresenter {

    func createSections() -> [TableSection] {
        var sections = [TableSection]()

        let loggerSection = createLoggerSection()
        sections.append(loggerSection)

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

    func createLoggerSection() -> TableSection {
        let openLogsFile = ActionModel(title: L10n.MainPresenter.Logger.LogFile.openActionTitle) { [weak self] in
            let filePath = DebugScreenConfiguration.shared.logCatcherService.logFilePath
            self?.onLogsFileOpen?(filePath)
        }

        let clearLogsFile = ActionModel(title: L10n.MainPresenter.Logger.LogFile.clearActionTitle) { [weak self] in
            DebugScreenConfiguration.shared.logCatcherService.clearLogFile { [weak self] isSuccess in
                let text = isSuccess ?
                    L10n.MainPresenter.Logger.ClearLogs.success :
                    L10n.MainPresenter.Logger.ClearLogs.error
                self?.onAlertShow?(text)
            }
        }

        let logsFileActionsProvider = ActionsProviderModel(
            header: L10n.MainPresenter.Logger.header,
            title: L10n.MainPresenter.Logger.LogFile.header,
            message: L10n.MainPresenter.Logger.LogFile.header,
            actions: [openLogsFile, clearLogsFile]
        )

        let catchInfoMessagesModel = FeatureToggleModel(
            text: L10n.MainPresenter.Logger.infoMessages,
            value: DebugScreenConfiguration.shared.logCatcherService.stdErrCatchingEnabled
        ) { isEnabled in
            DebugScreenConfiguration.shared.logCatcherService.stdOutCatchingEnabled = isEnabled
        }
        let catchErrorMessagesModel = FeatureToggleModel(
            text: L10n.MainPresenter.Logger.errorMessages,
            value: DebugScreenConfiguration.shared.logCatcherService.stdErrCatchingEnabled
        ) { isEnabled in
            DebugScreenConfiguration.shared.logCatcherService.stdErrCatchingEnabled = isEnabled
        }

        let blocks: [MainTableBlock] = [
            .featureToggle(model: catchInfoMessagesModel),
            .featureToggle(model: catchErrorMessagesModel),
            .featureAction(models: logsFileActionsProvider)
        ]

        return .init(title: logsFileActionsProvider.header, blocks: blocks)
    }

}
