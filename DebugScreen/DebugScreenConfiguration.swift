//
//  DebugScreenConfiguration.swift
//  DebugScreen
//
//  Created by Anton Shelar on 02.11.2020.
//

import Foundation

public class DebugScreenConfiguration {

    // MARK: - Public Properties

    public static let shared = DebugScreenConfiguration()

    /// Propertie for add configurations in clear cache
    public var cacheCleanerActionsProvider: CacheCleanerActionsProvider?
    /// Propertie for add configurations in server
    public var selectServerActionsProvider: SelectServerActionsProvider?
    /// Propertie for add configurations in feature toggle
    public var featureToggleActionsProvider: FeatureToggleActionsProvider?
    /// Propertie for add configure in log catche
    public var logCatcherService = LogCatcherService()

    // MARK: - Initialization

    private init() { }

}
