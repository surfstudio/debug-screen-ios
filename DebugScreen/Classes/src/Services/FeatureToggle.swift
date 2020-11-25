//
//  FeatureToggle.swift
//  DebugScreen
//
//  Created by Полина Полухина on 24.11.2020.
//

public protocol FeatureToggleActionsProvider {
    func actions() -> [FeatureToggleModel]
    func handleAction(with text: String, newValue: Bool)
}

public struct FeatureToggleModel {
    public let text: String
    public var value: Bool

    public init(text: String, value: Bool) {
        self.text = text
        self.value = value
    }
}
