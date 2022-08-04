//
//  SelectTextService.swift
//  DebugScreen
//
//  Created by Евгений Васильев on 03.08.2022.
//

import Foundation

/// Protocol for select server configurations
public protocol SelectTextService {
    /// Method returns all available server, that user may select
    ///
    /// - Returns: Text array
    func text() -> [SelectTextModel]
    /// Method that calls when user will select some server
    ///
    /// - Parameters:
    ///     - server: Selected text
    func didSelectText(_ text: SelectTextModel)
}

/// Model for Select Server configuration
public struct SelectTextModel {

    /// Text description
    public let title: String

    /// Allows you to create server action model
    ///
    /// - Parameters:
    ///   - url: Server's URL
    ///   - title: Server's name
    ///   - isActive: Server's status
    public init(title: String) {
        self.title = title
    }

}
