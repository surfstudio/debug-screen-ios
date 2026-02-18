//
//  MenuItemsSectionBuilder.swift
//  Example
//
//  Created by Aleksandr Potemkin on 13.02.2026.
//

import DebugScreen

final class MenuItemsSectionBuilder: SectionBuilder {

    // MARK: - Methods

    func build() -> TableSection {
        let blocks = configureMenuItemBlocks()

        return .init(title: L10n.MenuItems.header, blocks: blocks)
    }

}

// MARK: - Private Methods

private extension MenuItemsSectionBuilder {

    func configureMenuItemBlocks() -> [MainTableBlock] {
        let simpleItem = DebugScreenMenuItem(
            title: L10n.MenuItems.simpleTitle
        ) {
            debugPrint("✅ Simple menu item tapped")
        }

        let disclosureItem = DebugScreenMenuItem(
            title: L10n.MenuItems.disclosureTitle,
            showsDisclosure: true
        ) {
            let view = DestinationViewController()
            DebugScreenPresenterService.shared.showCustomScreen(view)
        }

        let multilineItem = DebugScreenMenuItem(
            title: L10n.MenuItems.multilineTitle,
            showsDisclosure: true
        ) {
            debugPrint("✅ Multiline menu item tapped")
        }

        let noActionItem = DebugScreenMenuItem(
            title: L10n.MenuItems.noActionTitle
        )

        return [
            .menuItem(model: simpleItem),
            .menuItem(model: disclosureItem),
            .menuItem(model: multilineItem),
            .menuItem(model: noActionItem)
        ]
    }

}
