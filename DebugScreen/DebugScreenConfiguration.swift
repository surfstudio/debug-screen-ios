//
//  DebugScreenConfiguration.swift
//  DebugScreen
//
//  Created by Anton Shelar on 02.11.2020.
//

/// Main configuration object for debug screen that provides all configurations for features
public class DebugScreenConfiguration {

    // MARK: - Public Properties

    /// Singleton that provides access to all configurations parameters
    public static let shared = DebugScreenConfiguration()

    /// Provider to action features
    public var actionsProvider: ActionsProvider?
    /// Provider that allows to select and change server address
    public var selectServerActionsProvider: SelectServerActionsProvider?
    /// Feature toggle configuration provider
    public var featureToggleActionsProvider: FeatureToggleActionsProvider?
    /// Service holds some texts, that you can select with performing some usefull action
    public var selectableTextProvider: SelectableTextProvider?
    
    /// Service that allows you to catch all logs from console
    ///
    /// if you want to enable it, than you have do it manually.
    /// See detail description in ``LogCatcherService``
    public var logCatcherService = LogCatcherService()

    // MARK: - Initialization

    private init() { }

}
