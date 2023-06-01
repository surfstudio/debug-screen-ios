//
//  ButtonCellModel.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 31.05.2023.
//

struct ButtonCellModel {

    // MARK: - Properties

    let title: String
    let actionType: ActionType

    // MARK: - Initialization

    init(title: String, actionType: ActionType = .primary) {
        self.title = title
        self.actionType = actionType
    }

}
