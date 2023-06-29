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
    var highlightedBackground: UIColor
    /// Button's background color for normal state.
    var normalBackground: UIColor
    /// Button's text color for all states.
    var textColor: UIColor

    // MARK: - Initialization

    public init(
        style: ActionStyle,
        highlightedBackground: UIColor? = nil,
        normalBackground: UIColor? = nil,
        textColor: UIColor? = nil
    ) {

        /// Set default colors according to button style
        self.init(highlightedBackground: style.highlightedBackgroundColor,
                  normalBackground: style.backgroundColor,
                  textColor: style.titleColor)

        /// Set custom colors (if needed)

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

     For example, we want to get primary button default appearance settings:
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
