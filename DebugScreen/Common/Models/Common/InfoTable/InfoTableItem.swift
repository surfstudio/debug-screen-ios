//
//  InfoTableItem.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 04.07.2023.
//

/// Representation of info table element.
public struct InfoTableItem {

    // MARK: - Properties

    /// Key, that will be used for title.
    let key: String
    /// Item's value.
    let value: String

    // MARK: - Initialization

    public init(key: String, value: String) {
        self.key = key
        self.value = value
    }

}
