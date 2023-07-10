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
        let showTouchesToggle = UserDefaultsFeatureToggle(
            title: L10n.FeatureToggles.firstToggleTitle,
            key: UserDefaultsKeys.isNeedShowTouches
        )

        let needUseSSHToggle = UserDefaultsFeatureToggle(
            title: L10n.FeatureToggles.secondToggleTitle,
            key: UserDefaultsKeys.isNeedUseSSH
        )

        let needShowEcomCatalogToggle = UserDefaultsFeatureToggle(
            title: L10n.FeatureToggles.thirdToggleTitle,
            key: UserDefaultsKeys.isNeedShowEcomCatalog
        )

        return [.toggle(model: showTouchesToggle),
                .toggle(model: needUseSSHToggle),
                .toggle(model: needShowEcomCatalogToggle)]
    }

}
