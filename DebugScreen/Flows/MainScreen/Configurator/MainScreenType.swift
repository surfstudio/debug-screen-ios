//
//  MainScreenType.swift
//  DebugScreen
//
//  Created by chausov on 18.02.2026.
//

enum MainScreenType {
    /// Main debug screen
    case root
    /// Nested debug screen
    case nested(model: NestedScreen)
}
