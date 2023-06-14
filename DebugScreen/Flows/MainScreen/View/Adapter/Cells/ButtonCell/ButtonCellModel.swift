//
//  ButtonCellModel.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 31.05.2023.
//

struct ButtonCellModel {

    // MARK: - Properties

    let title: String
    let actionStyle: ActionStyle

    // MARK: - Initialization

    init(title: String, actionStyle: ActionStyle = .primary) {
        self.title = title
        self.actionStyle = actionStyle
    }

}
