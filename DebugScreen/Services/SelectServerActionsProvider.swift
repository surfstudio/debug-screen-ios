//
//  ServersProvider.swift
//  DebugScreen
//
//  Created by Anton Shelar on 03.11.2020.
//

import Foundation

/// Protocol for configurations select server
public protocol SelectServerActionsProvider {
    /// Method for configurations servers in debug screen
    /// - Returns: Servers array
    func servers() -> [SelectServerAction]
    /// Method for configurations actions then chouse server
    /// - Parameter server: Server what get action
    func didSelectServer(_ server: SelectServerAction)
}

/// Model for configurations Select Server
public struct SelectServerAction {
    
    /// Sever's URL
    public let url: URL?
    /// Server's name
    public let title: String
    /// Server's status
    public let isActive: Bool

    /// Parameters for configurations server
    /// - Parameters:
    ///   - url: Server's URL
    ///   - title: Server's name
    ///   - isActive: Server's status
    public init(url: URL?, title: String, isActive: Bool) {
        self.url = url
        self.title = title
        self.isActive = isActive
    }
}
