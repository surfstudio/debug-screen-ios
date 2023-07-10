import DebugScreen

final class InfoTablesSectionBuilder: SectionBuilder {

    // MARK: - Methods

    func build() -> TableSection {
        let appInfo: InfoTableModel = .appInfoTable()
        let blocks: [MainTableBlock] = [
            .infoTable(model: appInfo)
        ]

        return .init(title: L10n.InfoTable.header, blocks: blocks)
    }

}
