//
//  MainTableBlock.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 01.06.2023.
//

/**
Debug screen main table blocks types.

Block is the main component of ``TableSection``. You can put this elements inside sections however you want.
There are no restrictions on the number of elements of different or the same type within one section.
*/
public enum MainTableBlock {
    /// Block with action button.
    case action(model: Action)
    /// Block with action list button.
    case actionList(model: ActionList)
    /// Block with CopiedText instance, whose value is copied on tap.
    case copiedText(model: CopiedText)
    /// A block with a title that, when clicked,
    /// opens a table containing key-value pairs.
    case infoTable(model: InfoTableModel)
    /// Block with selector (server selection, for example).
    case selectionList(model: SelectionList)
    /// Block with toggle.
    case toggle(model: FeatureToggle)
    /// Block with a custom menu item that performs an action on tap.
    case menuItem(model: MenuItem)
    /// Block that opens a nested section screen with its own table sections.
    case nestedScreen(model: NestedScreen)
}
