//
//  SelectTextService.swift
//  DebugScreen
//
//  Created by Евгений Васильев on 03.08.2022.
//

import Foundation

/// Protocol for selectable text provider entity
///
/// Holds some texts, that user can select (tap by cell) and do some useful action (e.x. copy it)
public protocol SelectableTextProvider {
    /// Method returns all available texts
    ///
    /// - Returns: Texts array
    func texts() -> [SelectableTextModel]
    /// Method that calls when user will select some text
    ///
    /// - Parameters:
    ///     - text: Selected text
    func didSelectText(_ text: SelectableTextModel)
}

/// Model holds info about some text
public struct SelectableTextModel {

    /// Text description
    public let title: String
    /// Useful value
    ///
    /// Optional value, you can skip it, if you doesn't need it
    public let value: String?

    /// Allows you to create text model
    ///
    /// - Parameters:
    ///   - title: promt text for value or concrete value
    ///   - value: optional value
    public init(title: String, value: String? = nil) {
        self.title = title
        self.value = value
    }

}
