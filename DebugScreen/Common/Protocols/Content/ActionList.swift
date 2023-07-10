//
//  ActionList.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 31.05.2023.
//

/// Provides custom actions list, that will be opened on button tap.
///
/// Action list include elements, that conforms to ``Action`` protocol.
public protocol ActionList {
    /// List name, that will be displayed on button.
    var title: String { get }
    /// Message, that will be displayed on top of actionSheet.
    var message: String? { get }
    /// Actions list (selectable options of actionsSheet).
    var actions: [Action] { get }
}
