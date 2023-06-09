//
//  ServerSelectionSectionBuilder.swift
//  Example
//
//  Created by Ilya Klimenyuk on 31.05.2023.
//

import DebugScreen
import Foundation

final class ServerSelectionSectionBuilder: SectionBuilder {

    // MARK: - Methods

    func build() -> TableSection {
        let blocks = configureSelectionList()

        return .init(title: L10n.ServerSelection.header, blocks: blocks)
    }

}

// MARK: - Private Methods

private extension ServerSelectionSectionBuilder {

    func configureSelectionList() -> [MainTableBlock] {

        let selectedServerUrl = UserDefaultsService().serverUrl
        var selectedItem: SelectionListItem?

        let items: [ServersSelectionItem] = [
            .init(name: L10n.ServerSelection.firstServerTitle, value: "https://surf.ru/address/prod"),
            .init(name: L10n.ServerSelection.secondServerTitle, value: "https://surf.ru/address/test"),
            .init(name: L10n.ServerSelection.thirdServerTitle, value: "https://surf.ru/address/stage")
        ]

        items.forEach { item in
            if
                let itemUrl = item.value as? String,
                itemUrl == selectedServerUrl
            {
                selectedItem = item
                return
            }
        }

        let selectionList = ServersSelectionList(items: items, selectedItem: selectedItem) { item in
            guard let url = item.value as? String else {
                return
            }

            UserDefaultsService().serverUrl = url
            debugPrint("✅ \(item.name) server selected")
        }

        return [.selectionList(model: selectionList)]
    }

}
