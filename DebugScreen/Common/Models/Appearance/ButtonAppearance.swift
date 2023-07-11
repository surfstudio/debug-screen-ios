//
//  ButtonAppearance.swift
//  
//
//  Created by Ilya Klimenyuk on 29.06.2023.
//

import UIKit

/// Debug screen button appearance.
///
/// Every debug screen button can be configured with custom background and text colors.
/// If custom colors haven't been initialized, the default colors will be used.
public struct ButtonAppearance {

    // MARK: - Properties

    /// Button's background color for highlighted and selected states.
    private(set) var highlightedBackground: UIColor
    /// Button's background color for normal state.
    private(set) var normalBackground: UIColor
    /// Button's text color for all states.
    private(set) var textColor: UIColor

    // MARK: - Initialization

    /// Allows you to create appearance object with default values,
    /// that depends on passed `style` parameter.
    public init(style: ActionStyle,
                highlightedBackground: UIColor? = nil,
                normalBackground: UIColor? = nil,
                textColor: UIColor? = nil) {
        // Set default colors according to button style
        self.init(highlightedBackground: style.highlightedBackgroundColor,
                  normalBackground: style.backgroundColor,
                  textColor: style.titleColor)

        // Set custom colors (if needed)
        if let highlightedBackground = highlightedBackground {
            self.highlightedBackground = highlightedBackground
        }

        if let normalBackground = normalBackground {
            self.normalBackground = normalBackground
        }

        if let textColor = textColor {
            self.textColor = textColor
        }
    }

    /// Allows you to create appearance object with your own custom values
    private init(highlightedBackground: UIColor,
                 normalBackground: UIColor,
                 textColor: UIColor) {
        self.highlightedBackground = highlightedBackground
        self.normalBackground = normalBackground
        self.textColor = textColor
    }

    // MARK: - Static Methods

    /**
     Get button appearance settings with selected style.
     - Parameter style: Button action style.
     - Returns: Button appearance.

     For example, if we want to get primary button default appearance settings:
     ```swift
     let primary: ButtonAppearance = .appearance(for: .primary)
     ```
     */
    static func appearance(for style: ActionStyle) -> ButtonAppearance {
        return .init(highlightedBackground: style.highlightedBackgroundColor,
                     normalBackground: style.backgroundColor,
                     textColor: style.titleColor)
    }

}
