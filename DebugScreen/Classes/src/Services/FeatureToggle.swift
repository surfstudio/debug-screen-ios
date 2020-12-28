//
//  FeatureToggle.swift
//  DebugScreen
//
//  Created by Полина Полухина on 24.11.2020.
//

public protocol FeatureToggleActionsProvider {
    func actions() -> [FeatureToggleModel]
    func handleAction(_ action: FeatureToggleModel)
}

public final class FeatureToggleModel {
    public let title: String
    public private(set) var isEnabled: Bool
    var didChangeEnabled: ((Bool) -> Void)?

    public init(title: String, isEnabled: Bool) {
        self.title = title
        self.isEnabled = isEnabled
    }

    public func setEnabled(_ enabled: Bool) {
        self.isEnabled = enabled
        didChangeEnabled?(enabled)
    }
}
