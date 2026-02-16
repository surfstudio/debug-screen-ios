//
//  SectionScreen.swift
//  DebugScreen
//
//  Created by Aleksandr Potemkin on 13.02.2026.
//

public protocol SectionScreen {
    /// Screen title displayed in the navigation bar.
    var title: String { get }
    /// Sections — same ``TableSection`` items as on the main screen.
    var sections: [TableSection] { get }
}
