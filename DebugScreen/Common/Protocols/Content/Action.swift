//
//  Action.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 31.05.2023.
//

/// Protocol for all debug screen actions.
///
/// All instances, that implements this protocol, can be grouped into `ActionList`
public protocol Action {
    /// Action's name, that will be displayed on button title
    var title: String { get }
    /// Action style
    var style: ActionStyle { get }
    /// Block of code, that will be performed on action button tap
    var block: (() -> Void)? { get }
}
