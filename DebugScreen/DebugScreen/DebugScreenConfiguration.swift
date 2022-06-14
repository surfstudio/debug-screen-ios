//
//  DebugScreenConfiguration.swift
//  DebugScreen
//
//  Created by Anton Shelar on 02.11.2020.
//

import Foundation

public class DebugScreenConfiguration {

    // MARK: - Public properties

    public static let shared = DebugScreenConfiguration()

    public var cacheCleanerActionsProvider: CacheCleanerActionsProvider?
    public var selectServerActionsProvider: SelectServerActionsProvider?
    public var featureToggleActionsProvider: FeatureToggleActionsProvider?
    public var logCatcherService = LogCatcherService()

    // MARK: - Initialization

    private init() { }
}
