//
//  NestedScreensSectionBuilder.swift
//  Example
//
//  Created by Aleksandr Potemkin on 13.02.2026.
//

import DebugScreen

final class NestedScreensSectionBuilder: SectionBuilder {

    // MARK: - Methods

    func build() -> TableSection {
        let blocks = configureNestedScreenBlocks()

        return .init(title: L10n.NestedScreens.header, blocks: blocks)
    }

}

// MARK: - Private Methods

private extension NestedScreensSectionBuilder {

    func configureNestedScreenBlocks() -> [MainTableBlock] {
        let settingsScreen = configureSettingsScreen()
        let nestedScreen = configureNestedScreen()

        return [
            .nestedScreen(model: settingsScreen),
            .nestedScreen(model: nestedScreen)
        ]
    }

    /// Simple section screen with toggles and copied text items inside.
    func configureSettingsScreen() -> DebugScreenNestedScreen {
        let toggle1 = UserDefaultsFeatureToggle(
            title: L10n.NestedScreens.Settings.firstToggleTitle,
            key: UserDefaultsKeys.isNeedShowTouches
        )
        let toggle2 = UserDefaultsFeatureToggle(
            title: L10n.NestedScreens.Settings.secondToggleTitle,
            key: UserDefaultsKeys.isNeedUseSSH
        )
        let togglesSection = TableSection(
            title: L10n.NestedScreens.Settings.togglesSectionTitle,
            blocks: [.toggle(model: toggle1), .toggle(model: toggle2)]
        )

        let copiedTextItem = CopiedTextItem(
            title: L10n.NestedScreens.Settings.copiedTextTitle,
            value: "example_api_key_12345"
        )
        let copiedTextSection = TableSection(
            title: L10n.NestedScreens.Settings.copiedTextSectionTitle,
            blocks: [.copiedText(model: copiedTextItem)]
        )

        return .init(
            title: L10n.NestedScreens.settingsTitle,
            sections: [togglesSection, copiedTextSection]
        )
    }

    /// Nested section screen that contains another section screen inside (recursive nesting demo).
    func configureNestedScreen() -> DebugScreenNestedScreen {
        // Deepest level – a screen with simple menu items
        let deepMenuItem = DebugScreenMenuItem(
            title: L10n.NestedScreens.Nested.deepMenuItemTitle
        ) {
            debugPrint("✅ Deep nested menu item tapped")
        }
        let deepInfoTable: InfoTableModel = .appInfoTable()
        let deepScreen = DebugScreenNestedScreen(
            title: L10n.NestedScreens.Nested.deepScreenTitle,
            sections: [
                .init(title: L10n.NestedScreens.Nested.deepMenuSectionTitle,
                      blocks: [.menuItem(model: deepMenuItem)]),
                .init(title: L10n.NestedScreens.Nested.deepInfoSectionTitle,
                      blocks: [.infoTable(model: deepInfoTable)])
            ]
        )

        // Middle level – contains a link to the deepest screen and its own content
        let middleMenuItem = DebugScreenMenuItem(
            title: L10n.NestedScreens.Nested.middleMenuItemTitle,
        ) {
            debugPrint("✅ Middle nested menu item tapped")
        }

        return .init(
            title: L10n.NestedScreens.nestedTitle,
            sections: [
                .init(title: L10n.NestedScreens.Nested.middleMenuSectionTitle,
                      blocks: [.menuItem(model: middleMenuItem)]),
                .init(title: L10n.NestedScreens.Nested.nestedScreenSectionTitle,
                      blocks: [.nestedScreen(model: deepScreen)])
            ]
        )
    }

}
