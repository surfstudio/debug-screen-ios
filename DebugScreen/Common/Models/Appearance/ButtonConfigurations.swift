//
//  ButtonConfigurations.swift
//  
//
//  Created by Ilya Klimenyuk on 29.06.2023.
//

/// Representation of all available action buttons apperance configurations.
public struct ButtonConfigurations {

    // MARK: - Properties

    /// Primary button apperance configuration.
    var primary: ButtonAppearance = .appearance(for: .primary)
    /// Secondary button appearance configuration.
    var secondary: ButtonAppearance = .appearance(for: .secondary)
    /// Destructive button apperance configuration.
    var destructive: ButtonAppearance = .appearance(for: .destructive)

    // MARK: - Initialization

    public init(primary: ButtonAppearance? = nil,
                secondary: ButtonAppearance? = nil,
                destructive: ButtonAppearance? = nil) {

        if let primary = primary {
            self.primary = primary
        }

        if let secondary = secondary {
            self.secondary = secondary
        }

        if let destructive = destructive {
            self.destructive = destructive
        }
    }

}
