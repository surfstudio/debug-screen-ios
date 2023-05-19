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
}

/// Model for Feature Toggle configuration
public struct FeatureToggleModel {

    /// Name for toggle
    public let text: String
    /// Toggle's status
    public var value: Bool
    /// Block of code, that will be performed on toggle switch
    public let block: ((Bool) -> Void)

    /// Allows you create feature toggle model
    ///
    /// - Parameters:
    ///   - text: Name for toggle
    ///   - value: Toggle's status
    ///   - block: Block of code, that will be performed on toggle switch
    public init(text: String, value: Bool, block: @escaping ((Bool) -> Void)) {
        self.text = text
        self.value = value
        self.block = block
    }
}
