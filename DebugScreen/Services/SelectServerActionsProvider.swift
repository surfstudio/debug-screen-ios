//
//  ServersProvider.swift
//  DebugScreen
//
//  Created by Anton Shelar on 03.11.2020.
//

import Foundation

/// Protocol for select server configurations
public protocol SelectServerActionsProvider {
    /// Method returns all available server, that user may select
    ///
    /// - Returns: Servers array
    func servers() -> [SelectServerActionModel]
    /// Method that calls when user will select some server
    /// 
    /// - Parameters:
    ///     - server: Selected server
    func didSelectServer(_ server: SelectServerActionModel)
}

/// Model for Select Server configuration
public struct SelectServerActionModel {

    /// Sever's URL
    public let url: URL?
    /// Server's name
    public let title: String
    /// Server's status
    public let isActive: Bool

    /// Allows you to create server action model
    ///
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
