//
//  ActionsProvider.swift
//  DebugScreen
//
//  Created by Anton Shelar on 02.11.2020.
//

import Foundation

/// Protocol for action configuration
public protocol ActionsProvider {
    /// Method returns all available actions
    /// - Returns: Actions, that will be display on the screen
    func makeActions() -> [ActionsProviderModel]
}

// MARK: - ActionsProviderModel

public struct ActionsProviderModel {

    /// Name of Action Provider
    public let header: String
    /// Content of label in cell
    public let title: String
    /// Message for Action Provider
    public let message: String
    /// Block of action for Action Provider
    public let actions: [ActionModel]

    // MARK: - Initialization

    /// Allows you create action provider
    /// - Parameters:
    ///   - title: Name of action provider
    ///   - actions: Block of code, that will be performed on action select
    public init(header: String, title: String, message: String, actions: [ActionModel]) {
        self.header = header
        self.title = title
        self.message = message
        self.actions = actions
    }

}

/// Model for action configuration
public struct ActionModel {

    // MARK: - Public Properties

    /// Name of Action
    public let title: String
    /// Block of code, that will be performed on action select
    public let block: (() -> Void)

    // MARK: - Initialization

    /// Allows you create action for action provider
    ///
    /// - Parameters:
    ///   - title: Name for action
    ///   - block: Block of code, that will be performed on action select
    public init(title: String, block: @escaping (() -> Void)) {
        self.title = title
        self.block = block
    }

}
