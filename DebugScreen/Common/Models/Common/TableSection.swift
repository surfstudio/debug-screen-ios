//
//  TableSection.swift
//  DebugScreen
//
//  Created by Евгений Васильев on 22.06.2022.
//

/// Model for main screen table section
public struct TableSection {

    // MARK: - Properties

    /// Section title, that will be displayed in section header view
    public let title: String
    /// Section elements list
    public let blocks: [MainTableBlock]

    // MARK: - Initialization

    public init(title: String, blocks: [MainTableBlock]) {
        self.title = title
        self.blocks = blocks
    }

}

// MARK: - Logger Section

public extension TableSection {

    // MARK: - Static Methods

    /// Build logger section with given components
    static func logger(with components: [LoggerSectionComponent]) -> TableSection {
        return LoggerSectionBuilder(components: components).build()
    }

}
