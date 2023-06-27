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
    /// Block with selector (server selection, for example).
    case selectionList(model: SelectionList)
    /// Block with toggle.
    case toggle(model: FeatureToggle)
}
