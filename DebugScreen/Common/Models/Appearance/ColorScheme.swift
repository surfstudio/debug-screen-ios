//
//  ColorScheme.swift
//  
//
//  Created by Ilya Klimenyuk on 29.06.2023.
//

import UIKit

/// Representation of DebugScreen color scheme.
///
/// You can override all available color components.
/// If custom colors haven't been initialized, the default colors will be used.
public struct ColorScheme {

    // MARK: - Properties

    /// DebugScreen views background color.
    var backgroundColor = Colors.Main.background
    /// DebugScreen text background color. Used for section headers and close icon.
    var textColor = Colors.Text.primary
    /// DebugScreen action buttons appearance configurations.
    var buttonConfigurations = ButtonConfigurations()

    // MARK: - Initialization

    public init(
        backgroundColor: UIColor? = nil,
        textColor: UIColor? = nil,
        buttonConfigurations: ButtonConfigurations? = nil
    ) {

        if let backgroundColor = backgroundColor {
            self.backgroundColor = backgroundColor
        }

        if let textColor = textColor {
            self.textColor = textColor
        }

        if let buttonConfigurations = buttonConfigurations {
            self.buttonConfigurations = buttonConfigurations
        }
    }

    // MARK: - Static Methods

    /// Get DebugScreen default color scheme.
    /// - Returns: Default color scheme.
    static func `default`() -> ColorScheme {
        return .init()
    }

}
