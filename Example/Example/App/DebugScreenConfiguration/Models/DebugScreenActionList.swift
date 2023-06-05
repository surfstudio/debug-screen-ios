//
//  DebugScreenActionList.swift
//  Example
//
//  Created by Ilya Klimenyuk on 29.05.2023.
//

import DebugScreen

final class DebugScreenActionList: ActionList {

    // MARK: - Properties

    let title: String
    let message: String?
    let actions: [Action]

    // MARK: - Initialization

    init(title: String, message: String?, actions: [Action]) {
        self.title = title
        self.message = message
        self.actions = actions
    }

}
