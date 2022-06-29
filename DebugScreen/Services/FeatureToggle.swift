//
//  FeatureToggle.swift
//  DebugScreen
//
//  Created by Полина Полухина on 24.11.2020.
//

/// Protocol for configurations  feature toggle 
public protocol FeatureToggleActionsProvider {
    /// Method for add some actions actions for feature toggle
    /// - Returns: Feature Toggle actions
    func actions() -> [FeatureToggleModel]
    /// Handler for actions
    /// - Parameters:
    ///   - text: Action's name
    ///   - newValue: New toggle status
    func handleAction(with text: String, newValue: Bool)
}

/// Model for configurations Feature Toggle
public struct FeatureToggleModel {
    
    /// Name for toggle
    public let text: String
    /// Toggle's status
    public var value: Bool

    /// Parameters for configurations cache cleaner action
    /// - Parameters:
    ///   - text: Name for toggle
    ///   - value: Toggle's status
    public init(text: String, value: Bool) {
        self.text = text
        self.value = value
    }
}
