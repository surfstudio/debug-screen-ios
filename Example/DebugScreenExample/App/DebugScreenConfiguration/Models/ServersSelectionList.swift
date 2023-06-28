//
//  ServersSelectionList.swift
//  Example
//
//  Created by Ilya Klimenyuk on 29.05.2023.
//

import DebugScreen
import Foundation

final class ServersSelectionItem: SelectionListItem {

    // MARK: - Properties

    let name: String
    let value: Any?

    // MARK: - Initialization

    init(name: String, value: Any?) {
        self.name = name
        self.value = value
    }

}

final class ServersSelectionList: SelectionList {

    // MARK: - Properties

    let items: [SelectionListItem]
    var selectedItem: SelectionListItem?
    let onSelectAction: ((SelectionListItem) -> Void)?

    // MARK: - Initialization

    init(items: [SelectionListItem],
         selectedItem: SelectionListItem?,
         onSelectAction: ((SelectionListItem) -> Void)?) {
        self.items = items
        self.selectedItem = selectedItem
        self.onSelectAction = onSelectAction
    }

}
