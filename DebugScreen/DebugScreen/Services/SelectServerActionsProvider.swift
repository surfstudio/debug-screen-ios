//
//  ServersProvider.swift
//  DebugScreen
//
//  Created by Anton Shelar on 03.11.2020.
//

import Foundation

public protocol SelectServerActionsProvider {
    func servers() -> [SelectServerAction]
    func didSelectServer(_ server: SelectServerAction)
}

public struct SelectServerAction {
    public let url: URL
    public let title: String
    public let isActive: Bool

    public init(url: URL, title: String, isActive: Bool) {
        self.url = url
        self.title = title
        self.isActive = isActive
    }
}
