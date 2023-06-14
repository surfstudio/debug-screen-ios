//
//  MainTableBlock.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 01.06.2023.
//

/// Debug screen main table blocks types
public enum MainTableBlock {
    /// Block with action button
    case action(model: Action)
    /// Block with action list button
    case actionList(model: ActionList)
    /// Block with CopiedText instance, whose value is copied when pressed
    case copiedText(model: CopiedText)
    /// Block with selector (server selection, for example)
    case selectionList(model: SelectionList)
    /// Block with toggle
    case toggle(model: FeatureToggle)
}
