//
//  DebugScreenAction.swift
//  Example
//
//  Created by Ilya Klimenyuk on 29.05.2023.
//

import DebugScreen

final class DebugScreenAction: Action {

    // MARK: - Properties

    let title: String
    let type: ActionType
    let block: (() -> Void)?

    // MARK: - Initialization

    init(title: String, type: ActionType = .primary, block: (() -> Void)?) {
        self.title = title
        self.type = type
        self.block = block
    }

}

final class DebugScreenActionsList: ActionsList {

    // MARK: - Properties

    var title: String
    var message: String?
    var actions: [Action]

    // MARK: - Initialization

    init(title: String, message: String?, actions: [Action]) {
        self.title = title
        self.message = message
        self.actions = actions
    }

}
