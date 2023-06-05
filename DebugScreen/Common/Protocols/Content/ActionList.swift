//
//  ActionList.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 31.05.2023.
//

/// Wrapper for action list item
public protocol ActionListItem {}

/// Protocol for action list
public protocol ActionList {
    /// List name, that will be displayed on button
    var title: String { get }
    /// Message, that will be displayed on top of actionSheet
    var message: String? { get }
    /// Actions list (selectable options of actionsSheet)
    var actions: [ActionListItem] { get }
}
