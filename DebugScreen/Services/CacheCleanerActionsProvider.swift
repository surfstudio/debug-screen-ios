//
//  CacheCleanerActionsProvider.swift
//  DebugScreen
//
//  Created by Anton Shelar on 02.11.2020.
//

import Foundation

/// Protocol for configurations cache cleaner
public protocol CacheCleanerActionsProvider {
    /// Method for add some actions for cache clean button
    /// - Returns: Cache cleaner actions
    func actions() -> [CacheCleanerAction]
}

// MARK: - CacheCleanerAction

/// Model for configurations Cache Cleaner
public struct CacheCleanerAction {

    // MARK: - Public properties

    /// Name of Action
    public let title: String
    /// Some action for model
    public let block: (() -> Void)

    // MARK: - Initialization

    /// Parameters for configurations cache cleaner action
    /// - Parameters:
    ///   - title: Name for action
    ///   - block: Some to do action
    public init(title: String, block: @escaping (() -> Void)) {
        self.title = title
        self.block = block
    }

}
