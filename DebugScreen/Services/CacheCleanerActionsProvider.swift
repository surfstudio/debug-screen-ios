//
//  CacheCleanerActionsProvider.swift
//  DebugScreen
//
//  Created by Anton Shelar on 02.11.2020.
//

import Foundation

/// Protocol for cache cleaner configuration
public protocol CacheCleanerActionsProvider {
    /// Method returns all available cache cleaner actions
    /// - Returns: Cache cleaner actions, that will be display on the screen
    func actions() -> [CacheCleanerAction]
}

// MARK: - CacheCleanerAction

/// Model for Cache Cleaner configuration
public struct CacheCleanerAction {

    // MARK: - Public Properties

    /// Name of Action
    public let title: String
    /// Block of code, that will be performed on action select
    public let block: (() -> Void)

    // MARK: - Initialization

    /// Allows you create cache cleaner action
    ///
    /// - Parameters:
    ///   - title: Name for action
    ///   - block: Block of code, that will be performed on action select
    public init(title: String, block: @escaping (() -> Void)) {
        self.title = title
        self.block = block
    }

}
