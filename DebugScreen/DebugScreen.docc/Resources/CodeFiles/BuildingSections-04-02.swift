import DebugScreen

final class CopiedTextSectionBuilder: SectionBuilder {

    // MARK: - Methods

    func build() -> TableSection {
        return .init(title: L10n.CopiedText.header, blocks: [])
    }

}
