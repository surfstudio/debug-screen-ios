//
//  MenuItem.swift
//  DebugScreen
//
//  Created by Aleksandr Potemkin on 13.02.2026.
//

public protocol MenuItem {
    /// Item title text (supports multiline).
    var title: String { get }
    /// Whether to show a disclosure indicator arrow.
    var showsDisclosure: Bool { get }
    /// Action performed on tap.
    var block: (() -> Void)? { get }
}
