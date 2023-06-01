//
//  Action.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 31.05.2023.
//

import UIKit

/// Protocol for simple action
public protocol Action {
    /// Action's name, that will be displayed on button title
    var title: String { get }
    /// Action type
    var type: ActionType { get }
    /// Block of code, that will be performed on action select
    var block: (() -> Void)? { get }
}

/// Action type, that affects on action button appearance
public enum ActionType {
    /// Primary action. It's default type for actions list button
    case primary
    /// Secondary action
    case secondary
    /// Destructive action (for example, clear cookies)
    case destructive
}

extension ActionType {

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
