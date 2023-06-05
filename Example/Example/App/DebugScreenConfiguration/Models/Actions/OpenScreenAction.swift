//
//  OpenScreenAction.swift
//  Example
//
//  Created by Ilya Klimenyuk on 05.06.2023.
//

import UIKit
import DebugScreen

final class OpenScreenAction: Action {

    // MARK: - Properties

    let title: String
    let style: ActionStyle
    let block: (() -> UIViewController)?

    // MARK: - Initialization

    init(title: String, style: ActionStyle = .primary, block: (() -> UIViewController)?) {
        self.title = title
        self.style = style
        self.block = block
    }

}
