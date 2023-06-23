//
//  Colors.swift
//  Example
//
//  Created by Ilya Klimenyuk on 20.06.2023.
//

import UIKit

enum Colors {

    enum Buttons {
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
    }

}
