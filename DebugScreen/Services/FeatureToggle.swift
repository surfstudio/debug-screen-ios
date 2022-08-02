//
//  FeatureToggle.swift
//  DebugScreen
//
//  Created by Полина Полухина on 24.11.2020.
//

/// Protocol for feature toggle configurations
public protocol FeatureToggleActionsProvider {
    /// Method returns all available feature toggles
    ///
    /// - Returns: Feature Toggle actions, that will be display on the screen
    func actions() -> [FeatureToggleModel]
    /// Method that calls when user will change some feature toggle
    ///
    /// - Parameters:
    ///   - text: Feature toggle name
    ///   - newValue: New toggle status
    func handleAction(with text: String, newValue: Bool)
}

/// Model for Feature Toggle configuration
public struct FeatureToggleModel {

    /// Name for toggle
    public let text: String
    /// Toggle's status
    public var value: Bool

    /// Allows you create feature toggle model
    ///
    /// - Parameters:
    ///   - text: Name for toggle
    ///   - value: Toggle's status
    public init(text: String, value: Bool) {
        self.text = text
        self.value = value
    }
}
