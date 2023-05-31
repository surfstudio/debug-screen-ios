//
//  ServersProvider.swift
//  Example
//
//  Created by Ilya Klimenyuk on 29.05.2023.
//

import DebugScreen
import Foundation

final class ServersProvider: SelectServerActionsProvider {

    private var serverActions = [
        SelectServerActionModel(
            url: URL(string: "https://surf.ru/address/prod"),
            title: L10n.SelectServerActionsProvider.FirstServer.title,
            isActive: false
        ),
        SelectServerActionModel(
            url: URL(string: "https://surf.ru/address/test"),
            title: L10n.SelectServerActionsProvider.SecondServer.title,
            isActive: true
        ),
        SelectServerActionModel(
            url: URL(string: "https://surf.ru/address/stage"),
            title: L10n.SelectServerActionsProvider.ThirdServer.title,
            isActive: false
        )
    ]

    func servers() -> [SelectServerActionModel] {
        return serverActions
    }

    func didSelectServer(_ server: SelectServerActionModel) {
        serverActions = serverActions.map {
            .init(url: $0.url, title: $0.title, isActive: $0.url == server.url)
        }
        // do something usefull
    }

}
