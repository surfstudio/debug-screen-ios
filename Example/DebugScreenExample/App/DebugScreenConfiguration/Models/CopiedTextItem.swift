//
//  CopiedTextItem.swift
//  Example
//
//  Created by Ilya Klimenyuk on 29.05.2023.
//

import DebugScreen

final class CopiedTextItem: CopiedText {

    // MARK: - Properties

    let title: String
    let value: String

    // MARK: - Initialization

    init(title: String, value: String) {
        self.title = title
        self.value = value
    }

}
