//
//  DebugScreenConfiguration.swift
//  DebugScreen
//
//  Created by Anton Shelar on 02.11.2020.
//

/// Main configuration object for debug screen that provides all features parameters.
public class DebugScreenConfiguration {

    // MARK: - Public Properties

    /// Singleton that provides access to all configurations parameters.
    public static let shared = DebugScreenConfiguration()

    /// Debug screen sections list.
    public var sections: [TableSection] = []

    /// Service that allows you to catch all logs from console.
    ///
    /// If you want to enable it, than you have do it manually.
    /// See detail description in ``LogCatcherService``.
    public var logCatcherService = LogCatcherService()

    /// Option that allows you to open Debug screen on device shake.
    /// Default value is `false`.
    public var isEnabledOnShake = false

    // MARK: - Initialization

    private init() { }

}
