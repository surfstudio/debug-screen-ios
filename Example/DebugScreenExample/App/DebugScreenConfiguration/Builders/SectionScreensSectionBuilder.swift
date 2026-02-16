//
//  SectionScreensSectionBuilder.swift
//  Example
//
//  Created by Aleksandr Potemkin on 13.02.2026.
//

import DebugScreen

final class SectionScreensSectionBuilder: SectionBuilder {

    // MARK: - Methods

    func build() -> TableSection {
        let blocks = configureSectionScreenBlocks()

        return .init(title: L10n.SectionScreens.header, blocks: blocks)
    }

}

// MARK: - Private Methods

private extension SectionScreensSectionBuilder {

    func configureSectionScreenBlocks() -> [MainTableBlock] {
        let settingsScreen = configureSettingsScreen()
        let nestedScreen = configureNestedScreen()

        return [
            .sectionScreen(model: settingsScreen),
            .sectionScreen(model: nestedScreen)
        ]
    }

    /// Simple section screen with toggles and copied text items inside.
    func configureSettingsScreen() -> DebugScreenSectionScreen {
        let toggle1 = UserDefaultsFeatureToggle(
            title: L10n.SectionScreens.Settings.firstToggleTitle,
            key: UserDefaultsKeys.isNeedShowTouches
        )
        let toggle2 = UserDefaultsFeatureToggle(
            title: L10n.SectionScreens.Settings.secondToggleTitle,
            key: UserDefaultsKeys.isNeedUseSSH
        )
        let togglesSection = TableSection(
            title: L10n.SectionScreens.Settings.togglesSectionTitle,
            blocks: [.toggle(model: toggle1), .toggle(model: toggle2)]
        )

        let copiedTextItem = CopiedTextItem(
            title: L10n.SectionScreens.Settings.copiedTextTitle,
            value: "example_api_key_12345"
        )
        let copiedTextSection = TableSection(
            title: L10n.SectionScreens.Settings.copiedTextSectionTitle,
            blocks: [.copiedText(model: copiedTextItem)]
        )

        return .init(
            title: L10n.SectionScreens.settingsTitle,
            sections: [togglesSection, copiedTextSection]
        )
    }

    /// Nested section screen that contains another section screen inside (recursive nesting demo).
    func configureNestedScreen() -> DebugScreenSectionScreen {
        // Deepest level – a screen with simple menu items
        let deepMenuItem = DebugScreenMenuItem(
            title: L10n.SectionScreens.Nested.deepMenuItemTitle
        ) {
            debugPrint("✅ Deep nested menu item tapped")
        }
        let deepInfoTable: InfoTableModel = .appInfoTable()
        let deepScreen = DebugScreenSectionScreen(
            title: L10n.SectionScreens.Nested.deepScreenTitle,
            sections: [
                .init(title: L10n.SectionScreens.Nested.deepMenuSectionTitle,
                      blocks: [.menuItem(model: deepMenuItem)]),
                .init(title: L10n.SectionScreens.Nested.deepInfoSectionTitle,
                      blocks: [.infoTable(model: deepInfoTable)])
            ]
        )

        // Middle level – contains a link to the deepest screen and its own content
        let middleMenuItem = DebugScreenMenuItem(
            title: L10n.SectionScreens.Nested.middleMenuItemTitle,
            showsDisclosure: true
        ) {
            debugPrint("✅ Middle nested menu item tapped")
        }

        return .init(
            title: L10n.SectionScreens.nestedTitle,
            sections: [
                .init(title: L10n.SectionScreens.Nested.middleMenuSectionTitle,
                      blocks: [.menuItem(model: middleMenuItem)]),
                .init(title: L10n.SectionScreens.Nested.nestedScreenSectionTitle,
                      blocks: [.sectionScreen(model: deepScreen)])
            ]
        )
    }

}
