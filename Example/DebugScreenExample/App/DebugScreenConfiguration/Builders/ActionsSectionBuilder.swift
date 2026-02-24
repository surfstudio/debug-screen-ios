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
        let pushScreenAction = getPushScreenAction()

        let actionList = configureActionList()

        blocks = [
            .actionList(model: actionList),
            .action(model: defaultAction),
            .action(model: destructiveAction),
            .action(model: openScreenAction),
            .action(model: pushScreenAction)
        ]

        return .init(title: L10n.Actions.header, blocks: blocks)
    }

}

// MARK: - Private Methods

private extension ActionsSectionBuilder {

    func getAction(style: ActionStyle) -> DebugScreenAction {
        let title = style == .secondary ? L10n.Actions.secondaryTitle : L10n.Actions.destructiveTitle
        let actionName = style == .secondary ? "Secondary" : "Destructive"

        let action: DebugScreenAction = .init(title: title, style: style) {
            debugPrint("✅ \(actionName) action complete")
        }

        return action
    }

    func getOpenScreenAction() -> DebugScreenAction {
        let action: DebugScreenAction = .init(title: L10n.Actions.openScreenTitle) {
            let view = DestinationViewController()
            DebugScreenPresenterService.shared.presentCustomScreen(view)
        }
        return action
    }

    func getPushScreenAction() -> DebugScreenAction {
        let action: DebugScreenAction = .init(title: L10n.Actions.pushScreenTitle) {
            let view = DestinationViewController()
            DebugScreenPresenterService.shared.pushCustomScreen(view)
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

    func getActionListModels() -> [Action] {
        let openScreenAction = getOpenScreenAction()

        let defaultAction: DebugScreenAction = .init(title: L10n.ActionList.defaultActionTitle) {
            debugPrint("✅ Default action complete")
        }

        let destructiveAction: DebugScreenAction = .init(title: L10n.Actions.destructiveTitle,
                                                         style: .destructive) {
            debugPrint("✅ Destructive action complete")
        }

        return [openScreenAction, defaultAction, destructiveAction]
    }

}
