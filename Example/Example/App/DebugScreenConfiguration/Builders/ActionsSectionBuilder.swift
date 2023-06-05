//
//  ActionsSectionBuilder.swift
//  Example
//
//  Created by Ilya Klimenyuk on 30.05.2023.
//

import DebugScreen
import UIKit

final class ActionsSectionBuilder: SectionBuilder {

    // MARK: - Methods

    func build() -> TableSection {
        var blocks: [MainTableBlock] = []

        let defaultAction = getAction(style: .secondary)
        let destructiveAction = getAction(style: .destructive)
        let openScreenAction = getOpenScreenAction()

        let actionList = configureActionList()

        blocks = [
            .actionList(model: actionList),
            .action(model: defaultAction),
            .action(model: destructiveAction),
            .action(model: openScreenAction)
        ]

        return .init(title: L10n.Actions.header, blocks: blocks)
    }

}

// MARK: - Private Methods

private extension ActionsSectionBuilder {

    func getAction(style: ActionStyle) -> DefaultAction {
        let title = style == .secondary ? L10n.Actions.secondaryTitle : L10n.Actions.destructiveTitle
        let actionName = style == .secondary ? "Secondary" : "Destructive"

        let action: DefaultAction = .init(title: title, style: style) {
            debugPrint("✅ \(actionName) action complete")
        }

        return action
    }

    func getOpenScreenAction() -> OpenScreenAction {
        let action: OpenScreenAction = .init(title: L10n.Actions.openScreenTitle) {
            return DestinationViewController()
        }
        return action
    }

    func configureActionList() -> DebugScreenActionList {
        let actions = getActionListModels()
        let actionList: DebugScreenActionList = .init(title: L10n.ActionList.title,
                                                      message: L10n.ActionList.message,
                                                      actions: actions)

        return actionList
    }

    func getActionListModels() -> [ActionListItem] {
        let openScreenAction = getOpenScreenAction()

        let defaultAction: DefaultAction = .init(title: L10n.ActionList.defaultActionTitle) {
            debugPrint("✅ Default action complete")
        }

        let destructiveAction: DefaultAction = .init(title: L10n.Actions.destructiveTitle,
                                                     style: .destructive) {
            debugPrint("✅ Destructive action complete")
        }

        return [openScreenAction, defaultAction, destructiveAction]
    }

}
