//
//  LoggerSectionBuilder.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 31.05.2023.
//

import Foundation

/// Builder for logger section. Build logger section with choosen components
final class LoggerSectionBuilder: SectionBuilder {

    // MARK: - Private Properties

    private let components: [LoggerSectionComponent]

    // MARK: - Initialization

    init(components: [LoggerSectionComponent]) {
        self.components = components
    }

    // MARK: - Methods

    func build() -> TableSection {
        let blocks = buildLoggerSectionBlocks()
        return .init(title: L10n.Logger.header, blocks: blocks)
    }

}

// MARK: - Private Methods

private extension LoggerSectionBuilder {

    func buildLoggerSectionBlocks() -> [MainTableBlock] {
        var blocks: [MainTableBlock] = []

        components.forEach { component in
            let block = buildBlock(for: component)
            blocks.append(block)
        }

        return blocks
    }

    func buildBlock(for component: LoggerSectionComponent) -> MainTableBlock {
        switch component {
        case .loggerActivationToggle:
            return buildLoggerActivationToggle()
        case .enableLogInfoToggle:
            return buildStreamCatcherToggle(title: L10n.Logger.enableLogInfoMessagesTitle, id: STDOUT_FILENO)
        case .enableLogErrorsToggle:
            return buildStreamCatcherToggle(title: L10n.Logger.enableLogErrorMessagesTitle, id: STDERR_FILENO)
        case .logFileActionsList:
            return buildLogFileActionsList()
        case .logFileOpenAction:
            return buildOpenLogFileActionBlock()
        case .logFileClearAction:
            return buildClearLogFileActionBlock()
        }
    }

    func buildLoggerActivationToggle() -> MainTableBlock {
        let model = LoggerActivationToggle(title: L10n.Logger.enableToggleTitle)
        return .toggle(model: model)
    }

    func buildStreamCatcherToggle(title: String, id: Int32) -> MainTableBlock {
        let model = LoggerStreamCatcherToggle(title: title, id: id)
        return .toggle(model: model)
    }

    func buildLogFileActionsList() -> MainTableBlock {
        let actions: [LoggerAction] = [
            configureOpenLogFileAction(with: L10n.Logger.LogFile.ActionsList.openActionTitle),
            configureClearLogFileAction(with: L10n.Logger.LogFile.ActionsList.clearActionTitle)
        ]

        let actionsList: LoggerActionsList = .init(title: L10n.Logger.LogFile.header,
                                                   message: L10n.Logger.LogFile.header,
                                                   actions: actions)

        return .actionsList(model: actionsList)
    }

    func buildOpenLogFileActionBlock() -> MainTableBlock {
        let model = configureOpenLogFileAction(with: L10n.Logger.openLogFileActionTitle)
        return .action(model: model)
    }

    func buildClearLogFileActionBlock() -> MainTableBlock {
        let model = configureClearLogFileAction(with: L10n.Logger.clearLogFileActionTitle)
        return .action(model: model)
    }

    func configureOpenLogFileAction(with title: String) -> LoggerAction {
        let openFileAction: LoggerAction = .init(title: title,
                                                 type: .primary) {
            DebugScreenPresenterService.shared.openLogFile()
        }

        return openFileAction
    }

    func configureClearLogFileAction(with title: String) -> LoggerAction {
        let clearFileAction: LoggerAction = .init(title: title,
                                                  type: .destructive) {
            DebugScreenConfiguration.shared.logCatcherService.clearLogFile { isSuccess in
                let message = isSuccess ?
                    L10n.Logger.ClearLogsAlert.success :
                    L10n.Logger.ClearLogsAlert.error

                DebugScreenPresenterService.shared.showAlert(with: message)
            }
        }

        return clearFileAction
    }

}
