//
//  ActionsSectionBuilder.swift
//  Example
//
//  Created by Ilya Klimenyuk on 30.05.2023.
//

import DebugScreen

final class ActionsSectionBuilder: SectionBuilder {

    // MARK: - Methods

    func build() -> TableSection {
        var blocks: [MainTableBlock] = []

        let defaultAction = getAction(type: .secondary)
        let destructiveAction = getAction(type: .destructive)

        let actionsList = configureActionsList()

        blocks = [
            .actionsList(model: actionsList),
            .action(model: defaultAction),
            .action(model: destructiveAction)
        ]

        return .init(title: L10n.Actions.header, blocks: blocks)
    }

}

// MARK: - Private Methods

private extension ActionsSectionBuilder {

    func getAction(type: ActionType) -> DebugScreenAction {
        let title = type == .secondary ? L10n.Actions.secondaryTitle : L10n.Actions.destructiveTitle
        let actionName = type == .secondary ? "Secondary" : "Destructive"

        let action: DebugScreenAction = .init(title: title, type: type) {
            debugPrint("✅ \(actionName) action complete")
        }

        return action
    }

    func configureActionsList() -> DebugScreenActionsList {
        let actions = getActionsListModels()
        let actionsList: DebugScreenActionsList = .init(title: L10n.ActionsList.title,
                                                        message: L10n.ActionsList.message,
                                                        actions: actions)

        return actionsList
    }

    func getActionsListModels() -> [DebugScreenAction] {
        let firstAction: DebugScreenAction = .init(title: L10n.ActionsList.firstActionTitle) {
            debugPrint("✅ First action complete")
        }

        let secondAction: DebugScreenAction = .init(title: L10n.ActionsList.secondActionTitle) {
            debugPrint("✅ Second action complete")
        }

        return [firstAction, secondAction]
    }

}
