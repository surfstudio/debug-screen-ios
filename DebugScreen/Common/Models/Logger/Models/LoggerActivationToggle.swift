//
//  LoggerActivationToggle.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 01.06.2023.
//

import Foundation

/// Logger section toggle model for activate writing logs process
/// Allows to activate / deactivate logger service
final class LoggerActivationToggle: FeatureToggle {

    // MARK: - Properties

    let title: String

    var isEnabled: Bool {
        get {
            DebugScreenConfiguration.shared.logCatcherService.isActive
        }
        set {
            DebugScreenConfiguration.shared.logCatcherService.isActive = newValue
        }
    }

    // MARK: - Initialization

    init(title: String) {
        self.title = title
    }

}
