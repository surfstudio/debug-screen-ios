//
//  ActionStyle.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 04.06.2023.
//

import UIKit

/// Action style, that affects on action button appearance
public enum ActionStyle {
    /// Primary action. It's default type for actions list button
    case primary
    /// Secondary action
    case secondary
    /// Destructive action (for example, clear cookies)
    case destructive
}

extension ActionStyle {

    /// Action button title color
    var titleColor: UIColor {
        switch self {
        case .primary:
            return Colors.Buttons.Primary.text
        case .destructive:
            return Colors.Buttons.Destructive.text
        case .secondary:
            return Colors.Buttons.Secondary.text
        }
    }

    /// Action button normal background color
    var backgroundColor: UIColor {
        switch self {
        case .primary:
            return Colors.Buttons.Primary.normalBackground
        case .destructive:
            return Colors.Buttons.Destructive.normalBackground
        case .secondary:
            return Colors.Buttons.Secondary.normalBackground
        }
    }

    /// Action button highlighted and selected color
    var highlightedBackgroundColor: UIColor {
        switch self {
        case .primary:
            return Colors.Buttons.Primary.highlightedBackground
        case .destructive:
            return Colors.Buttons.Destructive.highlightedBackground
        case .secondary:
            return Colors.Buttons.Secondary.highlightedBackground
        }
    }

}
