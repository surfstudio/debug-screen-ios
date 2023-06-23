//
//  TogglesSectionBuilder.swift
//  Example
//
//  Created by Ilya Klimenyuk on 30.05.2023.
//

import DebugScreen

final class TogglesSectionBuilder: SectionBuilder {

    // MARK: - Methods

    func build() -> TableSection {
        let blocks = configureTogglesBlocks()

        return .init(title: L10n.FeatureToggles.header, blocks: blocks)
    }

}

// MARK: - Private Methods

private extension TogglesSectionBuilder {

    func configureTogglesBlocks() -> [MainTableBlock] {
        let showTouchesToggle: UserDefaultsFeatureToggle = .init(title: L10n.FeatureToggles.firstToggleTitle,
                                                                 key: UserDefaultsKeys.isNeedShowTouches)

        let needUseSSHToggle: UserDefaultsFeatureToggle = .init(title: L10n.FeatureToggles.secondToggleTitle,
                                                                key: UserDefaultsKeys.isNeedUseSSH)

        let needShowEcomCatalogToggle: UserDefaultsFeatureToggle = .init(title: L10n.FeatureToggles.thirdToggleTitle,
                                                                         key: UserDefaultsKeys.isNeedShowEcomCatalog)

        return [.toggle(model: showTouchesToggle),
                .toggle(model: needUseSSHToggle)]
    }

}
