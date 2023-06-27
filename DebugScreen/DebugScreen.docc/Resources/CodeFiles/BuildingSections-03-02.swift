import DebugScreen

final class TogglesSectionBuilder: SectionBuilder {

    // MARK: - Methods

    func build() -> TableSection {
        return .init(title: L10n.FeatureToggles.header, blocks: [])
    }

}
