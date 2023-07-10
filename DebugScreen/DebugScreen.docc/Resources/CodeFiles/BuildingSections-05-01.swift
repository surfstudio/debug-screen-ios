import DebugScreen

final class InfoTablesSectionBuilder: SectionBuilder {

    // MARK: - Methods

    func build() -> TableSection {
        return .init(title: L10n.InfoTable.header, blocks: [])
    }

}
