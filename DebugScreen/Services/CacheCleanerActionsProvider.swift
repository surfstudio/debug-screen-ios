//
//  CacheCleanerActionsProvider.swift
//  DebugScreen
//
//  Created by Anton Shelar on 02.11.2020.
//

import Foundation

public protocol CacheCleanerActionsProvider {
    func actions() -> [CacheCleanerAction]
}

// MARK: - CacheCleanerAction

public struct CacheCleanerAction {

    // MARK: - Public Properties

    public let title: String
    public let block: (() -> Void)

    // MARK: - Initialization

    public init(title: String, block: @escaping (() -> Void)) {
        self.title = title
        self.block = block
    }

}
