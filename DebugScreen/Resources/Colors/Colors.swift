//
//  StringAttributes.swift
//
//
//  Created by Евгений Васильев on 27.06.2022.
//

import UIKit

enum Colors {

    enum Buttons {
        enum Destructive {
            static let highlightedBackground = Resources.Colors.Buttons.Destructive.highlightedBackground.color
            static let normalBackground = Resources.Colors.Buttons.Destructive.normalBackground.color
            static let text = Resources.Colors.Buttons.Destructive.text.color
        }

        enum Primary {
            static let highlightedBackground = Resources.Colors.Buttons.Primary.highlightedBackground.color
            static let normalBackground = Resources.Colors.Buttons.Primary.normalBackground.color
            static let text = Resources.Colors.Buttons.Primary.text.color
        }

        enum Secondary {
            static let highlightedBackground = Resources.Colors.Buttons.Secondary.highlightedBackground.color
            static let normalBackground = Resources.Colors.Buttons.Secondary.normalBackground.color
            static let text = Resources.Colors.Buttons.Secondary.text.color
        }
    }

    enum Main {
        static let background = Resources.Colors.Main.background.color
    }

    enum Text {
        static let primary = Resources.Colors.Text.primary.color
        static let secondary = Resources.Colors.Text.secondary.color
    }

}
