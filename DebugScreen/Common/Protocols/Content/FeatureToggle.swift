//
//  FeatureToggle.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 31.05.2023.
//

/// Provides toggles for activate / disable your application features.
public protocol FeatureToggle {
    /// Toggle's name.
    var title: String { get }
    /// Toggle's status.
    var isEnabled: Bool { get set }
}
