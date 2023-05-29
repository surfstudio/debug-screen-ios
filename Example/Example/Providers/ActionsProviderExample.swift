//
//  ActionsProviderExample.swift
//  Example
//
//  Created by Ilya Klimenyuk on 29.05.2023.
//

import DebugScreen

final class ActionsProviderExample: ActionsProvider {

    func makeActions() -> [ActionsProviderModel] {
        let modelForFirstAction = ActionModel(title: L10n.ActionsProvider.FirstAction.title, block: {
            print("perform first clear action")
        })
        let modelForSecondAction = ActionModel(title: L10n.ActionsProvider.SecondAction.title, block: {
            print("perform second clear action")
        })

        return [
            ActionsProviderModel(
                header: L10n.ActionsProvider.FirstAction.header,
                title: L10n.ActionsProvider.FirstAction.title,
                message: L10n.ActionsProvider.FirstAction.message,
                actions: [modelForFirstAction, modelForSecondAction]
            ),
            ActionsProviderModel(
                header: L10n.ActionsProvider.SecondAction.header,
                title: L10n.ActionsProvider.SecondAction.title,
                message: L10n.ActionsProvider.SecondAction.message,
                actions: [modelForFirstAction, modelForSecondAction]
            )
        ]

    }
}
