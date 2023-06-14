//
//  DebugScreenAction.swift
//  Example
//
//  Created by Ilya Klimenyuk on 05.06.2023.
//

import DebugScreen

final class DebugScreenAction: Action {

    // MARK: - Properties

    let title: String
    let style: ActionStyle
    let block: (() -> Void)?

    // MARK: - Initialization

    init(title: String, style: ActionStyle = .primary, block: (() -> Void)?) {
        self.title = title
        self.style = style
        self.block = block
    }

}
