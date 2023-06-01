//
//  SelectionList.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 31.05.2023.
//

/// Protocol for selection list item
public protocol SelectionListItem {
    /// Item's name, that will be displayed on selection list item
    var name: String { get }
    /// Items's value
    var value: Any? { get }
}

/// Protocol for list of selection items
public protocol SelectionList {
    /// Items list
    var items: [SelectionListItem] { get }
    /// Selected item
    var selectedItem: SelectionListItem? { get set }
    /// Action, triggered on select item
    var onSelectAction: ((SelectionListItem) -> Void)? { get }
}
