//
//  LoggerAction.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 31.05.2023.
//

/// Logger section action model
final class LoggerAction: Action {

    // MARK: - Properties

    let title: String
    let style: ActionStyle
    let block: (() -> Void)?

    // MARK: - Initialization

    init(title: String, style: ActionStyle, block: (() -> Void)?) {
        self.title = title
        self.style = style
        self.block = block
    }

}

/// Logger section action list model
final class LoggerActionList: ActionList {

    // MARK: - Properties

    let title: String
    let message: String?
    let actions: [ActionListItem]

    // MARK: - Initialization

    init(title: String, message: String?, actions: [ActionListItem]) {
        self.title = title
        self.message = message
        self.actions = actions
    }

}
