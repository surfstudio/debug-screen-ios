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
    let type: ActionType
    let block: (() -> Void)?

    // MARK: - Initialization

    init(title: String, type: ActionType, block: (() -> Void)?) {
        self.title = title
        self.type = type
        self.block = block
    }

}

/// Logger section actions list model
final class LoggerActionsList: ActionsList {

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
