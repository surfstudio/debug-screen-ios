//
//  DebugScreenNestedScreen.swift
//  Example
//
//  Created by Aleksandr Potemkin on 13.02.2026.
//

import DebugScreen

final class DebugScreenNestedScreen: NestedScreen {

    // MARK: - Properties

    let title: String
    let sections: [TableSection]

    // MARK: - Initialization

    init(title: String, sections: [TableSection]) {
        self.title = title
        self.sections = sections
    }

}
