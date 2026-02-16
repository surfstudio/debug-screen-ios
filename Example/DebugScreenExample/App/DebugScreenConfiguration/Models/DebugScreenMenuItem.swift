//
//  DebugScreenMenuItem.swift
//  Example
//
//  Created by Aleksandr Potemkin on 13.02.2026.
//

import DebugScreen

final class DebugScreenMenuItem: MenuItem {

    // MARK: - Properties

    let title: String
    let showsDisclosure: Bool
    let block: (() -> Void)?

    // MARK: - Initialization

    init(title: String, showsDisclosure: Bool = false, block: (() -> Void)? = nil) {
        self.title = title
        self.showsDisclosure = showsDisclosure
        self.block = block
    }

}
