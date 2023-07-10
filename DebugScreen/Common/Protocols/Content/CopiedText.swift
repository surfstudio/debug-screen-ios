//
//  CopiedText.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 31.05.2023.
//

/// Allows to add text, that will be copied to clipboard on tap.
///
/// Holds some texts, that user can select (tap by cell) and copy it to clipboard.
public protocol CopiedText {
    /// Description, that will be shown on screen.
    var title: String { get }
    /// Useful value, that will be copied on cell select.
    var value: String { get }
}
