//
//  LoggerStreamCatcherToggle.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 31.05.2023.
//

import Foundation

/// Logger section catcher's toggles model
final class LoggerStreamCatcherToggle: FeatureToggle {

    // MARK: - Properties

    let title: String

    var isEnabled: Bool {
        get {
            return getLoggerSettings()
        }
        set {
            updateLoggerSettings(with: newValue)
        }
    }

    // MARK: - Private Properties

    private let id: Int32

    // MARK: - Initialization

    init(title: String, id: Int32) {
        self.title = title
        self.id = id
    }

}

// MARK: - Private Methods

private extension LoggerStreamCatcherToggle {

    func getLoggerSettings() -> Bool {
        if id == STDOUT_FILENO {
            return DebugScreenConfiguration.shared.logCatcherService.writeInfoMessages
        } else if id == STDERR_FILENO {
            return DebugScreenConfiguration.shared.logCatcherService.writeErrorMessages
        }

        return true
    }

    func updateLoggerSettings(with value: Bool) {
        if id == STDOUT_FILENO {
            DebugScreenConfiguration.shared.logCatcherService.writeInfoMessages = value
        } else if id == STDERR_FILENO {
            DebugScreenConfiguration.shared.logCatcherService.writeErrorMessages = value
        }
    }

}
